variable "prefix" {}
variable "env" {}
variable "extra_containers" {
  type        = list(string)
  description = "Additional storage containers to create in the CRM storage account"
  default     = []
}
variable "exact_containers" {
  type        = list(string)
  description = "Exact storage containers to create in the CRM storage account, replacing any default containers"
  default     = []
}
variable "backup_storage_enabled" {
  type        = bool
  description = "Enable CRM backup storage account"
  default     = true
}

locals {
  prefix = "${var.prefix}-${var.env}"
}

resource "azurerm_resource_group" "crm" {
  name     = "${local.prefix}-crm-rg"
  location = "westeurope"
}

module "crm_storage" {
  source = "../../modules/storage"

  config = {
    name                = replace("${local.prefix}-crm", "-", "")
    resource_group_name = azurerm_resource_group.crm.name
    location            = azurerm_resource_group.crm.location
    containers = length(var.exact_containers) > 0 ? var.exact_containers : concat(
      ["crm-data", "crm-logs"],
      var.extra_containers,
    )
  }
}

module "crm_backup_storage" {
  count = var.backup_storage_enabled ? 1 : 0

  source = "../../modules/storage"

  config = {
    name                = replace("${local.prefix}-crm-bkp", "-", "")
    resource_group_name = azurerm_resource_group.crm.name
    location            = azurerm_resource_group.crm.location
    containers          = ["crm-backup"]
  }
}
