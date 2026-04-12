resource "azurerm_resource_group" "vnet_rg" {
  name     = "myTFVnetRG"
  location = "uksouth"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "myTFVnet"
  location            = azurerm_resource_group.vnet_rg.location
  resource_group_name = azurerm_resource_group.vnet_rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "myTFSubnet"
  resource_group_name  = azurerm_resource_group.vnet_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}