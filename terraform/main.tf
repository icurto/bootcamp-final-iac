terraform {
  backend "azurerm" {
    resource_group_name  = "ironhack-final-tfstate-rg"
    storage_account_name = "ironhackfinaltfstatestg"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}

  subscription_id = "1ca8d3ea-3b84-49f5-afde-7b4ebe3a62eb"
}

resource "azurerm_resource_group" "myRg" {
  name = "ironhack-final-rg"

  location = "West Europe"

}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "ironhack-final-aks"
  location            = azurerm_resource_group.myRg.location
  resource_group_name = azurerm_resource_group.myRg.name
  dns_prefix          = "ironhack-final-dns-k8s"
  kubernetes_version  = "1.32.0"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  identity {
    type = "SystemAssigned"
  }

}