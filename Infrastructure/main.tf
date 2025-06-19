# Main file calling modules


data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

module "network" {
  source = "./modules/network"
  resource_group_name = data.azurerm_resource_group.rg.name
  location = var.location
  vnet_name = var.vnet-name
  vnet_address_space = var.vnet_address_space
  subnet_name = var.subnet-name
  subnet_address_prefix = var.subnet_address_prefix
  
}

module "vm" {
  source              = "./modules/vm"
  vm_count            = 2
  vm_name_prefix      = var.vm_name_prefix
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id           = module.network.subnet_id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  vm_size             = var.vm_size
}

module "load_balancer" {
  source              = "./modules/load_balancer"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  # public_ip_id        = azurerm_public_ip.pip.id
}

module "app_service" {
  source              = "./modules/app_service"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  app_count           = 3
  app_name_prefix     = "frontend"
  docker_image        = "nginx:latest"
}
