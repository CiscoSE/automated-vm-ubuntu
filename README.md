# Automated-VM-Ubuntu Terrafrom Module


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | n/a |
| <a name="provider_vsphere"></a> [vsphere](#provider\_vsphere) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vsphere_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/virtual_machine) | resource |
| [template_file.cloud-init](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [vsphere_compute_cluster.cluster](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/compute_cluster) | data source |
| [vsphere_datacenter.dc](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datacenter) | data source |
| [vsphere_datastore.datastore](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datastore) | data source |
| [vsphere_distributed_virtual_switch.dvs](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/distributed_virtual_switch) | data source |
| [vsphere_network.vm_network](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/network) | data source |
| [vsphere_virtual_machine.template](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/virtual_machine) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ansible_vars"></a> [ansible\_vars](#input\_ansible\_vars) | n/a | `string` | n/a | yes |
| <a name="input_playbook"></a> [playbook](#input\_playbook) | n/a | `string` | n/a | yes |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | n/a | `string` | `"~/.ssh/id_rsa"` | no |
| <a name="input_vm_cpus"></a> [vm\_cpus](#input\_vm\_cpus) | n/a | `string` | `1` | no |
| <a name="input_vm_disk_label"></a> [vm\_disk\_label](#input\_vm\_disk\_label) | n/a | `string` | `"disk0"` | no |
| <a name="input_vm_dns"></a> [vm\_dns](#input\_vm\_dns) | n/a | `string` | n/a | yes |
| <a name="input_vm_gateway"></a> [vm\_gateway](#input\_vm\_gateway) | n/a | `string` | n/a | yes |
| <a name="input_vm_ip"></a> [vm\_ip](#input\_vm\_ip) | n/a | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | n/a | `string` | n/a | yes |
| <a name="input_vm_netmask"></a> [vm\_netmask](#input\_vm\_netmask) | n/a | `string` | n/a | yes |
| <a name="input_vm_password"></a> [vm\_password](#input\_vm\_password) | n/a | `string` | n/a | yes |
| <a name="input_vm_ram"></a> [vm\_ram](#input\_vm\_ram) | n/a | `string` | `1024` | no |
| <a name="input_vm_ssh_key"></a> [vm\_ssh\_key](#input\_vm\_ssh\_key) | n/a | `string` | n/a | yes |
| <a name="input_vm_user"></a> [vm\_user](#input\_vm\_user) | n/a | `string` | n/a | yes |
| <a name="input_vsphere_cluster"></a> [vsphere\_cluster](#input\_vsphere\_cluster) | n/a | `string` | n/a | yes |
| <a name="input_vsphere_datacenter"></a> [vsphere\_datacenter](#input\_vsphere\_datacenter) | n/a | `string` | n/a | yes |
| <a name="input_vsphere_datastore"></a> [vsphere\_datastore](#input\_vsphere\_datastore) | n/a | `string` | n/a | yes |
| <a name="input_vsphere_dvs"></a> [vsphere\_dvs](#input\_vsphere\_dvs) | n/a | `string` | n/a | yes |
| <a name="input_vsphere_folder"></a> [vsphere\_folder](#input\_vsphere\_folder) | n/a | `string` | n/a | yes |
| <a name="input_vsphere_network"></a> [vsphere\_network](#input\_vsphere\_network) | n/a | `string` | `"quarantine"` | no |
| <a name="input_vsphere_template"></a> [vsphere\_template](#input\_vsphere\_template) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vm_ip_addr"></a> [vm\_ip\_addr](#output\_vm\_ip\_addr) | n/a |
<!-- END_TF_DOCS -->