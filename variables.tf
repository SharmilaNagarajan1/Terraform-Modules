# variable "resource_group_location" {
#   type        = string
#   default     = "westus"
#   description = "Location of the resource group."
# }


# variable "resource_group_name" {
#   type        = string
#   default     = "kml_rg_main-9684c2d5a34c40e8"
#   description = "Resource group name in your Azure subscription."
# }

variable "vnet1_name" {}
variable "vnet1_address_space" {
  type = list(string)
}
variable "vnet1_location" {}
variable "vnet1_resource_group_name" {}

variable "vnet2_name" {}
variable "vnet2_address_space" {
  type = list(string)
}
variable "vnet2_location" {}
variable "vnet2_resource_group_name" {}

