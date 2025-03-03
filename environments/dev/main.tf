terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  profile = "terraform-user"
}


module "network" {
  source = "../../modules/network"

  environment     = var.environment
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets #["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = var.private_subnets
  availability_zones  = var.availability_zones
}

module "security_groups"{
  source= "../../modules/security"

  environment = var.environment
  vpc_id = module.network.vpc_id
}

module "application_load_balancer"{
source = "../../modules/lb"

  environment = var.environment
  vpc_id = module.network.vpc_id
  subnet_ids = module.network.public_subnet_ids
  security_group_ids= [module.security_groups.alb_security_group_id]
  instance_ids      = module.ec2.instance_ids 
}

module "ec2"{
source = "../../modules/compute"

  environment = var.environment
  availability_zones= var.availability_zones
  public_subnet_ids=module.network.public_subnet_ids
  vpc_security_group_ids= [module.security_groups.ec2_security_group_id]
}
