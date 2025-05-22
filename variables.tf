variable "admin_username" {
  default = "azureuser"
}

variable "ssh_public_key" {
  description = "Your SSH public key"
  type        = string
}

variable "environment_name" {
  type = string
}

variable "primary_location" {
  type = string
}

variable "application_name" {
  type = string
}

variable "resource_group_name" {
  type    = string
  default = "rg-prod-infra"
}
