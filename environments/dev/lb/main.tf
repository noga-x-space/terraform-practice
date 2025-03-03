# module "network" {
#   source = "../../modules/network"

#   environment     = "dev"
#   vpc_cidr        = "10.0.0.0/16"
#   public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
#   private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
#   availability_zones  = ["us-east-1a", "us-east-1b"]
# }

# module "security_groups"{
#   source= "../../modules/security"

#   environment = "dev"
#   vpc_id = module.network.vpc_id
# }

module "application_load_balancer"{
source = "../../modules/lb"

  environment = "dev"
  vpc_id = module.network.vpc_id
  subnet_ids = module.network.public_subnet_ids
  security_group_ids= [module.security_groups.alb_security_group_id]
  instance_ids      = module.ec2.instance_ids 
}

# module "ec2"{
# source = "../../modules/compute"

#   environment = "dev"
#   # vpc_id = module.network.vpc_id
#   # subnet_ids = module.network.public_subnet_ids
#   # security_group_ids= [module.security_groups.alb_security_group_id]
#   availability_zones= ["us-east-1a", "us-east-1b"]
#   public_subnet_ids=module.network.public_subnet_ids
#   vpc_security_group_ids= [module.security_groups.ec2_security_group_id]
# }
