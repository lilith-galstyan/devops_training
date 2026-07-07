variable "sa_name" {
  description = "The name of the Storage Account."
  type        = string
}

variable "sa_replication_type" {
  description = "The replication type of the Storage Account."
  type        = string
}

variable "sa_container_name" {
  description = "The name of the Blob Container."
  type        = string
}

variable "location" {
  description = "Region where the resource group is located."
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources."
  type        = map(string)
}

variable "application_source_dir" {
  description = "Path to the application source directory to archive."
  type        = string
}
