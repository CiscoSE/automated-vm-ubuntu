output "vm_name" {
  value = vsphere_virtual_machine.vm.name
}

output "vm_ip_addr" {
  value = vsphere_virtual_machine.vm.default_ip_address
}
