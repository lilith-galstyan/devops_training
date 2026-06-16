variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "cmaz-iaco50xm-mod4-rg"
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "cmaz-iaco50xm-mod4-vnet"
}

variable "vnet_address_space" {
  description = "Address space for the Virtual Network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
  default     = "frontend"
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the Subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "nic_name" {
  description = "Name of the Network Interface"
  type        = string
  default     = "cmaz-iaco50xm-mod4-nic"
}

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
  default     = "cmaz-iaco50xm-mod4-nsg"
}

variable "nsg_http_rule_name" {
  description = "Name of the NSG inbound HTTP rule"
  type        = string
  default     = "AllowHTTP"
}

variable "nsg_ssh_rule_name" {
  description = "Name of the NSG inbound SSH rule"
  type        = string
  default     = "AllowSSH"
}

variable "public_ip_name" {
  description = "Name of the Public IP"
  type        = string
  default     = "cmaz-iaco50xm-mod4-pip"
}

variable "dns_name_label" {
  description = "DNS name label for the Public IP"
  type        = string
  default     = "cmaz-iaco50xm-mod4-nginx"
}

variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
  default     = "cmaz-iaco50xm-mod4-vm"
}

variable "vm_os_version" {
  description = "Offer of the Ubuntu image"
  type        = string
  default     = "ubuntu-24_04-lts"
}

variable "vm_os_sku" {
  description = "SKU of the Ubuntu image (maps to source_image_reference.sku)"
  type        = string
  default     = "server"
}

variable "vm_size" {
  description = "SKU/size of the Virtual Machine"
  type        = string
  default     = "Standard_B2s_v2"
}

variable "vm_admin_username" {
  description = "Admin username for the Virtual Machine"
  type        = string
  default     = "azureuser"
}

variable "vm_password" {
  description = "Admin password for the Virtual Machine."
  type        = string
  sensitive   = true
}

variable "nic_ip_configuration_name" {
  description = "Name of the IP configuration block within the Network Interface"
  type        = string
  default     = "internal"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {
    Creator = "lilit_galstyan@epam.com"
  }
}