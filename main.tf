terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  client_id       = "0eed9de5-597c-4b2b-a782-82ed223286b3"
  client_secret   = "Vqc8Q~oav2R0b.zBBvkLWveSwfLkFjwLNzU9wbpg"
  tenant_id       = "da2bdaec-85d6-4559-b749-24a2935c917c"
  subscription_id = "a29aef98-af71-4b9b-b9bf-ee11a8e1ca00"
}
resource "azurerm_resource_group" "nikki_rg" {
  name     = "nikki-resources"
  location = "East US"

  tags = {
    environment = "Dev"
  }
}
resource "azurerm_virtual_network" "nikki_vn" {
  name                = "nikki_network"
  resource_group_name = azurerm_resource_group.nikki_rg.name
  location            = azurerm_resource_group.nikki_rg.location
  address_space            = ["10.123.0.0/16"]

  tags = {
    environment = "Dev"
  }
}

resource "azurerm_subnet" "nikki_subnet" {
  name                 = "nikki_subnet"
  resource_group_name  = azurerm_resource_group.nikki_rg.name
  virtual_network_name = azurerm_virtual_network.nikki_vn.name
  address_prefixes     = ["10.123.1.0/24"]
}
