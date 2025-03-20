
# variable "role_name" {
#   description = "role name"
#   default = "cluster_admin"
# }

# variable "users" {
#   description = "name a user group with access to k8s cluster"
#   type = string
#   default = "developers"
# }
# variable "env" {
#   description = "environment"
#   type = string
#   default = "dev"
# }

# variable "eks_version" {
#   description = "eks_version"
#   type = string
#   default = "20.34.0"
# }

variable "user_name" {
  description = "user to give admin access to eks"
  type = string
  default = "cluster-admin"
}