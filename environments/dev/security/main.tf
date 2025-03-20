data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "terraform-s3-state-noga"
    key    = "dev/network/backend.tfstate"
    region = "us-east-1"
    #   profile = "sandbox-user" 
  }
}

//this sets 3 sgs: pub ec2, private vpn ec2, vpn sg
// by lb will be created according to boolean
module "security_groups" {
  source = "../../../modules/security"

  private_subnets = data.terraform_remote_state.network.outputs.private_subnets
  environment     = var.environment
  vpc_id          = data.terraform_remote_state.network.outputs.vpc_id
}

