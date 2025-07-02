module "src" {
  source = "../../../src/crm"

  prefix                 = "jt-tf-ex"
  env                    = "dev"
  exact_containers       = ["crm-debug-logs"]
  backup_storage_enabled = false
}
