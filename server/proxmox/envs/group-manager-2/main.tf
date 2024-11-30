# main.tf

module "vm_module" {
  source = "../../modules/lxc"

  settings = var.settings
}
