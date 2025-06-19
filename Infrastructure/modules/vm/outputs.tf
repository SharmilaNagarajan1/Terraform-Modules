# Example vm module outputs.tf

output "nic_ids" {
  value = [for nic in azurerm_network_interface.nic : nic.id]
}
