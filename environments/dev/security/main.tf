data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket                  = "terraform-s3-state-noga"
    key                     = "dev/network/backend.tfstate"  
    region                  = "us-east-1"
    profile                 = "sandbox-user"
  }
}

module "security_groups"{
  source= "../../../modules/security"

  environment = var.environment
  vpc_id = data.terraform_remote_state.network.outputs.vpc_id
}
