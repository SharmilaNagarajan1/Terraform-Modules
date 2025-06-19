terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "random" {
  # Configuration options
}


resource "random_string" "random" {
  length = 6
  special  = false
  upper  = false 
}


resource "azurerm_storage_account" "storage" {
  name = "${lower(var.base-name)}${random_string.random.result}"
  resource_group_name = var.resource_group_name
  location = var.location
  account_tier = "Standard"
  account_replication_type = "GRS"
}