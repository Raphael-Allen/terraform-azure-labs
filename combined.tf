resource "azurerm_resource_group" "combined_rg" {
  name     = "myTFCombinedRG"
  location = "uksouth"
}

resource "azurerm_virtual_network" "combined_vnet" {
  name                = "myTFCombinedVnet"
  location            = azurerm_resource_group.combined_rg.location
  resource_group_name = azurerm_resource_group.combined_rg.name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "combined_subnet" {
  name                 = "myTFCombinedSubnet"
  resource_group_name  = azurerm_resource_group.combined_rg.name
  virtual_network_name = azurerm_virtual_network.combined_vnet.name
  address_prefixes     = ["10.1.1.0/24"]
}

resource "azurerm_storage_account" "combined_storage" {
  name                     = "mytfcombinedraph01"
  resource_group_name      = azurerm_resource_group.combined_rg.name
  location                 = azurerm_resource_group.combined_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}