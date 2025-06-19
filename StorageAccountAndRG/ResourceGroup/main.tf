resource "azurerm_resource_group" "rg" {
  name = "${var.base-name}-rg"
  location = var.location
}