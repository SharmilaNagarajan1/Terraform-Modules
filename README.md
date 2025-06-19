# Terraform Azure VNet Module

A reusable Terraform module to provision an Azure Virtual Network (VNet). Ideal for use across multiple environments (dev, staging, prod) and projects.

---

## ✅ Features

- Creates an Azure Virtual Network (VNet)
- Accepts custom address space
- Reusable, version-controlled module
- Output returns VNet ID

---
- Create multiple VNets by passing values in terraform.tfvars file 
vnet1_name = "my-vnet1"
vnet1_address_space = [ "10.0.0.0/16" ]
vnet1_location  = "<location>"
vnet1_resource_group_name = "<res_group_name>"

vnet2_name = "my-vnet2"
vnet2_address_space = [ "10.1.0.0/16" ]
vnet2_location  = "<location>"
vnet2_resource_group_name = "<res_group_name>"

# Create an Azure Virtual Network using a public module
## We'll use the public module from the Terraform Registry: Azure/vnet/azurerm
### main.tf
provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "rg" {
  name     = "<res_group_name>"
  location = "westus"
}

module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "5.0.1"
  vnet_name = "my-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  vnet_location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]

  subnet_names    = ["subnet1", "subnet2"]
  subnet_prefixes = ["10.0.1.0/24", "10.0.2.0/24"]
}
