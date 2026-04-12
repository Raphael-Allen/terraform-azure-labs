resource "azurerm_resource_group" "storage_rg" {
  name     = "myTFStorageRG"
  location = "uksouth"
}

resource "azurerm_storage_account" "storage" {
  name                     = "mytfstorageraph01"
  resource_group_name      = azurerm_resource_group.storage_rg.name
  location                 = azurerm_resource_group.storage_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}