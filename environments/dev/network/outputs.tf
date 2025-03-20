output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "private_subnets" {
  value = var.private_subnets
}
output "private_subnets_ids" {
  value = module.network.private_subnet_ids
}
output "public_subnets" {
  value = var.public_subnets
}

output "vpc_cidr" {
  description = "CIDR VPC"
  value       = module.network.vpc_cidr
}