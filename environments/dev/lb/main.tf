data "terraform_remote_state" "security" {
  backend = "s3"
  config = {
    bucket  = "terraform-s3-state-noga"
    key     = "dev/security/backend.tfstate"
    region  = "us-east-1"
    profile = "sandbox-user"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket  = "terraform-s3-state-noga"
    key     = "dev/network/backend.tfstate"
    region  = "us-east-1"
    profile = "sandbox-user"
  }
}

data "terraform_remote_state" "compute" {
  backend = "s3"
  config = {
    bucket  = "terraform-s3-state-noga"
    key     = "dev/compute/backend.tfstate"
    region  = "us-east-1"
    profile = "sandbox-user"
  }
}


module "application_load_balancer" {
  source = "../../../modules/lb"

  environment        = var.environment
  vpc_id             = data.terraform_remote_state.network.outputs.vpc_id
  subnet_ids         = data.terraform_remote_state.network.outputs.public_subnet_ids
  security_group_ids = [data.terraform_remote_state.security.outputs.alb_security_group_id]
  instance_ids       = data.terraform_remote_state.compute.outputs.instance_ids
}
