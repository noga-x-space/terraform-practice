
module "security_groups"{
  source= "../../modules/security"

  environment = "dev"
  vpc_id = module.network.vpc_id
}
