terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "5768238c-1ecd-49ab-83cc-b09bf70a7bff"
}
