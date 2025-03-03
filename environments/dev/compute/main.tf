data "ec2_security_group_id" "ec2_security_group_id" {
    # get object from s3 bucket state.
}
module "ec2"{
source = "../../modules/compute"

  environment = var.environment
  availability_zones= var.availability_zones
  public_subnet_ids=module.network.public_subnet_ids
  # vpc_security_group_ids= [module.security_groups.ec2_security_group_id]
  vpc_security_group_ids= [data.ec2_security_group_id.ec2_security_group_id]
}

