/*
Copyright (c) 2021 Cisco and/or its affiliates.

This software is licensed to you under the terms of the Cisco Sample
Code License, Version 1.1 (the "License"). You may obtain a copy of the
License at

               https://developer.cisco.com/docs/licenses

All use of the material herein must be in accordance with the terms of
the License. All rights not expressly granted by the License are
reserved. Unless required by applicable law or agreed to separately in
writing, software distributed under the License is distributed on an "AS
IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
or implied.
*/

locals {
  vapp_properties = {
    "instance-id" = var.vm_name,
    "hostname"    = var.vm_name,
    "user-data"   = base64encode(data.template_file.cloud-init.rendered)
  }
}

resource "vsphere_virtual_machine" "vm" {
  name             = var.vm_name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  folder           = var.vsphere_folder

  num_cpus = var.vm_cpus
  memory   = var.vm_ram
  guest_id = data.vsphere_virtual_machine.template.guest_id

  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  network_interface {
    network_id   = data.vsphere_network.vm_network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = var.vm_disk_label
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  cdrom {
    client_device = true
  }

  vapp {
    properties = local.vapp_properties
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  provisioner "remote-exec" {
    inline = [
      "sudo cloud-init status --wait"
    ]
    connection {
      host        = self.default_ip_address
      type        = "ssh"
      user        = var.vm_user
      private_key = file(var.private_key)
    }
  }
  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ${var.vm_user} --private-key=${var.private_key} -i '${self.default_ip_address},' --become --extra-vars \"${var.ansible_vars}\"  ${var.playbook}"
    connection {
      host        = self.default_ip_address
      type        = "ssh"
      user        = var.vm_user
      private_key = file(var.private_key)
    }
  }
}