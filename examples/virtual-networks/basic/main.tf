provider "azurerm" {
  version = "=1.29.0"
}

terraform {
  backend "azurerm" {
    storage_account_name = "vtltdsa"
    container_name       = "vtltdtfstate"
    key                  = "basenet"
  }
}

resource "azurerm_virtual_network" "vtltd-net" {
  name                = "${var.prefix}-network"
  resource_group_name = "${var.resource_group}"
  location            = "${var.location}"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "vtltd-subnet" {
  name                 = "internal"
  virtual_network_name = "${azurerm_virtual_network.vtltd-net.name}"
  resource_group_name  = "${var.resource_group}"
  address_prefix       = "10.0.1.0/24"
}
