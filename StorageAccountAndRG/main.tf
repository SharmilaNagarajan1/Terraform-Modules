terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.0.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

module "ResourceGroup" {
  source = "./ResourceGroup"
  base-name = var.base-name
  location = "westus"
}

module "StorageAccount" {
  source = "./StorageAccount"
  base-name = var.base-name
  resource_group_name = module.ResourceGroup.resource_group_name
  location = "westus"
}

