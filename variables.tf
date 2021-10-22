variable "vsphere_datacenter" {
  type = string
}

variable "vsphere_datastore" {
  type = string
}

variable "vsphere_cluster" {
  type = string
}

variable "vsphere_dvs" {
  type = string
}

variable "vsphere_template" {
  type = string
}

variable "vsphere_folder" {
  type = string
}

variable "vsphere_network" {
  type    = string
  default = "quarantine"
}

variable "vm_name" {
  type = string
}

variable "vm_cpus" {
  type = string
  default = 1
}

variable "vm_ram" {
  type = string
  default = 1024
}

variable "vm_disk_label" {
  type = string
  default = "disk0"
}

variable "vm_ip" {
  type = string
}

variable "vm_gateway" {
  type = string
}

variable "vm_netmask" {
  type = string
}

variable "vm_dns" {
  type = string
}

variable "vm_user" {
  type = string
}

variable "vm_password" {
  type      = string
  sensitive = true
}

variable "vm_ssh_key" {
  type      = string
  sensitive = true
}

variable "ansible_vars" {
  type = string
}

variable "playbook" {
  type = string
}

variable "private_key" {
  type    = string
  default = "~/.ssh/id_rsa"
}