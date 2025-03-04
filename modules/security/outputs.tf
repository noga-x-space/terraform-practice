output "ec2_sg_name" {
  value       = aws_security_group.ec2_sg.name
  description = "security group name"
}
output "alb_sg_name" {
  value       = aws_security_group.alb_sg.name
  description = "security group name"
}

output "alb_security_group_id" {
  description = "ID of the ALB security group"
  value       = aws_security_group.alb_sg.id
}

output "ec2_security_group_id" {
  description = "ID of the EC2 security group"
  value       = aws_security_group.ec2_sg.id
}
