module "null_resource" {
  source = "./null-res-module"
  }

module "res-count" {
  source = "./resource-count"
  input = module.null_resource
}