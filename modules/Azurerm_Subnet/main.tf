resource "azurerm_subnet" "subnets" {
  for_each             = var.subnetss
  name                 = each.value.subnet_name
  resource_group_name  = each.value.rg_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.ad_ip
}