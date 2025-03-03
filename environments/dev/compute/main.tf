data "terraform_remote_state" "security" {
  backend = "s3"
  config = {
    bucket                  = "terraform-s3-state-noga"
    key                     = "envs/security/backend.tfstate"  
    region                  = "us-east-1"
    profile                 = "sandbox-user"
  }
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket                  = "terraform-s3-state-noga"
    key                     = "envs/network/backend.tfstate"  
    region                  = "us-east-1"
    profile                 = "sandbox-user"
  }
}

module "ec2"{
source = "../../../modules/compute" 

  environment = var.environment
  availability_zones= var.availability_zones
  public_subnet_ids=data.terraform_remote_state.network.outputs.public_subnet_ids
  vpc_security_group_ids = data.terraform_remote_state.security.outputs.ec2_security_group_id
} 

