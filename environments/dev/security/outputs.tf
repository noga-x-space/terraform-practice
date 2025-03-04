output "ec2_sg_name" {
  value = module.security_groups.ec2_sg_name
}
output "alb_sg_name" {
  value = module.security_groups.alb_sg_name
}

output "alb_security_group_id" {
  value = module.security_groups.alb_security_group_id
}

output "ec2_security_group_id" {
  value = module.security_groups.ec2_security_group_id
}
