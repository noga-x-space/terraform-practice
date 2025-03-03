
module "application_load_balancer"{
source = "../../modules/lb"

  environment = var.environment
  vpc_id = module.network.vpc_id
  subnet_ids = module.network.public_subnet_ids
  security_group_ids= [module.security_groups.alb_security_group_id]
  instance_ids      = module.ec2.instance_ids 
}
