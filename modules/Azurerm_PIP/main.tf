resource "azurerm_public_ip" "pip" {
  for_each            = var.public_ips
  name                = each.value.public_ip_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  allocation_method   = each.value.method

}