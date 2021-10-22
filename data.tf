data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vsphere_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_distributed_virtual_switch" "dvs" {
  name          = var.vsphere_dvs
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "vm_network" {
  name                            = var.vsphere_network
  datacenter_id                   = data.vsphere_datacenter.dc.id
  distributed_virtual_switch_uuid = data.vsphere_distributed_virtual_switch.dvs.id
}

data "template_file" "cloud-init" {
  # Main cloud-config configuration file.
  template = file("${path.module}/cloud-init.yaml")
  vars = {
    user     = var.vm_user
    password = var.vm_password
    ssh_key  = var.vm_ssh_key
    vm_ip    = var.vm_ip
    vm_gw    = var.vm_gateway
    netmask  = var.vm_netmask
    dns      = var.vm_dns
  }
}