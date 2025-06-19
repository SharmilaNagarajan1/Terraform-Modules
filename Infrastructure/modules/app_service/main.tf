# Example app_service module main.tf


resource "azurerm_service_plan" "plan" {

  name                = "app-service-plan"
  location            = var.location
  resource_group_name = var.resource_group_name   
  sku_name = "B1"
  os_type = "Linux"
}

resource "azurerm_app_service" "app" {
  count               = var.app_count
  name                = "${var.app_name_prefix}-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_service_plan.plan.id
  site_config {
    linux_fx_version = "DOCKER|${var.docker_image}"
  }
}
