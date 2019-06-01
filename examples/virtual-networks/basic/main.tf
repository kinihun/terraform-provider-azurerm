provider "azurerm" {
  version = "=1.29.0"
}

terraform {
  backend "azurerm" {
    storage_account_name = "${var.account_name}"
    container_name       = "vtltdtfstate"
    key                  = "basenet"
    access_key           = "${var.access_key}"
  }
}

resource "azurerm_virtual_network" "vtltd-net" {
  name                = "${var.prefix}-network"
  resource_group_name = "${var.resource_group}"
  location            = "${azurerm_resource_group.example.location}"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = "internal"
  virtual_network_name = "${azurerm_virtual_network.example.name}"
  resource_group_name  = "vtltd-rg"
  address_prefix       = "10.0.1.0/24"
}
