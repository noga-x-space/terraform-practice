module "network" {
  source = "../../../modules/network"

  environment        = var.environment
  vpc_cidr           = var.vpc_cidr        # "10.0.0.0/16"
  public_subnets     = var.public_subnets  # ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = var.private_subnets # ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones = var.availability_zones
}
