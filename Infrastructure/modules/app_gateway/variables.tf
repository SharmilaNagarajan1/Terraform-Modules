# Example app_gateway module variables.tf

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "app_gateway_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "gateway_capacity" {
  type    = number
  default = 2
}

variable "backend_addresses" {
  type = list(string)
}

variable "environment" {
  type    = string
  default = "dev"
}
