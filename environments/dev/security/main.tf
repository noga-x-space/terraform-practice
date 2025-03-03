
module "security_groups"{
  source= "../../modules/security"

  environment = var.environment
  vpc_id = module.network.vpc_id
}
