module "resource_group" {
  source = "../../modules/azurerm_resource_group_Storagte_account"
  rgs    = var.rgs
}
module "virtual_network" {
    depends_on = [ module.resource_group ]
  source = "../../modules/Azurerm_Virtual_Network"
  vnet   = var.vnet
}
module "subnet" {
    depends_on = [ module.resource_group,module.virtual_network ]
  source   = "../../modules/Azurerm_Subnet"
  subnetss = var.subnetss
}
module "public_ip" {
  depends_on = [ module.resource_group ]
  source     = "../../modules/Azurerm_PIP"
  public_ips = var.public_ips
}
module "virtual_machine" {
    depends_on = [ module.subnet,module.public_ip ]
  source = "../../modules/Azureem_virtual_machine"
  vms    = var.vms
}