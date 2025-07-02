terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "b5d88a63-e32d-4458-a045-f04c2f7782f3"
}
