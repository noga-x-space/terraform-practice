output "public_ec2_sg_name" {
  value = module.security_groups.public_ec2_sg_name
}
output "alb_sg_name" {
  value = module.security_groups.alb_sg_name
}

output "alb_security_group_id" {
  value = module.security_groups.alb_security_group_id
}

output "public_ec2_security_group_id" {
  value = module.security_groups.public_ec2_security_group_id
}

output "private_ec2_security_group_id" {
  description = "ID of the private EC2 security group"
  value       = module.security_groups.private_ec2_security_group_id
}

output "vpn_security_group_id" {
  description = "ID of the VPN security group"
  value       = module.security_groups.vpn_security_group_id
}

