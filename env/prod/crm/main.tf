module "src" {
  source = "../../../src/crm"

  prefix           = "jt-tf-ex"
  env              = "prod"
  extra_containers = ["crm-archive", "crm-backup"]
}
