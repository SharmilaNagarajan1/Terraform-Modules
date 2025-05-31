# Terraform Azure VNet Module

A reusable Terraform module to provision an Azure Virtual Network (VNet). Ideal for use across multiple environments (dev, staging, prod) and projects.

---

## ✅ Features

- Creates an Azure Virtual Network (VNet)
- Accepts custom address space
- Reusable, version-controlled module
- Output returns VNet ID

---
- Cretae multiple VNets by passing values in terraform.tfvars file 
vnet1_name = "my-vnet1"
vnet1_address_space = [ "10.0.0.0/16" ]
vnet1_location  = "<location>"
vnet1_resource_group_name = "<res_group_name>"

vnet2_name = "my-vnet2"
vnet2_address_space = [ "10.1.0.0/16" ]
vnet2_location  = "<location>"
vnet2_resource_group_name = "<res_group_name>"