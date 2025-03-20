# output "cluster_endpoint" {
#   value = module.eks.cluster_endpoint
# }

# output "cluster_name" {
#   value= module.eks.cluster_name
# }

# output "cluster_ca_with_this[0]"{
#   # value = module.eks.cluster_certificate_authority_data
#   description = "Base64 encoded certificate data"
#   value       = aws_eks_cluster.this[0].certificate_authority[0].data
# }

# output "cluster_ca_without_this[0]"{
#   value = module.eks.cluster_certificate_authority_data
# }

# output "role_arn" {
#   value = data.aws_iam_role.cluster_admin.arn
# }

