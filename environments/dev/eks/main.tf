data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "terraform-s3-state-noga"
    key    = "dev/network/backend.tfstate"
    region = "us-east-1"
    #   profile = "sandbox-user"  
  }
}

data "terraform_remote_state" "security" {
  backend = "s3"
  config = {
    bucket = "terraform-s3-state-noga"
    key    = "dev/security/backend.tfstate"
    region = "us-east-1"
    #   profile = "sandbox-user" 
  }
}

data "aws_iam_role" "cluster_admin" {
  name = "cluster-admin"
}

module "eks" {
  source = "../../../modules/eks"

  user_name = var.user_name
  private_ec2_sg_id   = [data.terraform_remote_state.security.outputs.private_ec2_security_group_id]
  public_ec2_sg_id    = [data.terraform_remote_state.security.outputs.public_ec2_security_group_id]
  role_name           = data.aws_iam_role.cluster_admin.name
  vpc                 = data.terraform_remote_state.network.outputs.vpc_id
  public_subnets_ids  = data.terraform_remote_state.network.outputs.public_subnet_ids
  private_subnets_ids = data.terraform_remote_state.network.outputs.private_subnets_ids
}
