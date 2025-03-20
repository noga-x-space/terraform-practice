output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "List of public subnet IDs"
  value       = aws_subnet.private[*].id
}

output "private_subnets" {
  value = var.private_subnets
}

# output "availability_zones" {
#   description = "avilability zone list"
#   value = []
# }