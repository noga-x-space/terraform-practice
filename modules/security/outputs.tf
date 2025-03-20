output "public_ec2_sg_name" {
  value       = aws_security_group.public_ec2_sg.name
  description = "security group name"
}
output "private_ec2_sg_name" {
  value       = aws_security_group.private_ec2_sg.name
  description = "security group name"
}
output "alb_sg_name" {
  value       = aws_security_group.alb_sg[*].name
  description = "security group name"
}

//need to update
output "alb_security_group_id" {
  description = "ID of the ALB security group"
  value       = aws_security_group.alb_sg[*].id
}

output "public_ec2_security_group_id" {
  description = "ID of the EC2 security group"
  value       = aws_security_group.public_ec2_sg.id
}

output "private_ec2_security_group_id" {
  description = "ID of the EC2 security group"
  value       = aws_security_group.private_ec2_sg.id
}

output "vpn_security_group_id" {
  description = "ID of the VPN security group"
  value = aws_security_group.vpn_access.id
}