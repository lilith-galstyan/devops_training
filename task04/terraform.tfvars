location            = "West Europe"
resource_group_name = "cmaz-iaco50xm-mod4-rg"
vnet_name           = "cmaz-iaco50xm-mod4-vnet"
subnet_name         = "frontend"
nic_name            = "cmaz-iaco50xm-mod4-nic"
nsg_name            = "cmaz-iaco50xm-mod4-nsg"
nsg_http_rule_name  = "AllowHTTP"
nsg_ssh_rule_name   = "AllowSSH"
public_ip_name      = "cmaz-iaco50xm-mod4-pip"
dns_name_label      = "cmaz-iaco50xm-mod4-nginx"
vm_name             = "cmaz-iaco50xm-mod4-vm"
vm_os_version       = "ubuntu-24_04-lts"
vm_size             = "Standard_B2s_v2"
vm_admin_username   = "azureuser"

tags = {
  Creator = "lilit_galstyan@epam.com"
}