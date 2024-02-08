variable "location" {
  description = "azure location"
  type        = string
}

variable "resource_group_name" {
  description = "name of azure resource group which contains the target virtual network"
  type        = string
}

variable "name" {
  description = "name of private dns resolver"
  type        = string
}

variable "virtual_network_name" {
  description = "name of azure virtual network which will contain private dns resolver"
  type        = string
}

variable "subnet_inbound_name" {
  description = "name of azure virtual network which will contain private dns resolver"
  type        = string
}

variable "subnet_outbound_name" {
  description = "name of azure virtual network which will contain private dns resolver"
  type        = string
}