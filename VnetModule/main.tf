# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "3.53.0"
#     }
#    }
# }

provider "azurerm" {
  # Configuration options
  features {}
 resource_provider_registrations = "none"
}


module "vnet1"{
  source = "./modules/vnet"
  vnet_name = var.vnet1_name
  address_space = var.vnet1_address_space
  location= var.vnet1_location
  resource_group_name = var.vnet1_resource_group_name

}
output "vent1_id" {
  value = module.vnet1.vnet_id
}
module "vnet2"{
  source = "./modules/vnet"
  vnet_name = var.vnet2_name
  address_space = var.vnet2_address_space
  location= var.vnet2_location
  resource_group_name = var.vnet2_resource_group_name

}
output "vent2_id" {
  value = module.vnet2.vnet_id
}


