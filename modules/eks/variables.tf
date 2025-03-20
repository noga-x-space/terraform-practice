variable "user_name" {
  description = "name an existing user"
  type = string
}

variable "role_name" {
  description = "name an existing role"
  type = string
}

variable "group_name" {
  description = "name a user group with access to k8s cluster"
  type = string
  default = "developers"
}
variable "env" {
  description = "environment"
  type = string
  default = "dev"
}

variable "cluster_version" {
  
  description = "cluster_version"
  type = string
  default = "1.32"
}

variable "vpc" {
  type = string
  description = "vpc cidr"
}

variable "private_subnets_ids" {
  type = list(string)
  description = "subnets cidrs"
}
variable "public_subnets_ids" {
  type = list(string)
  description = "subnets cidrs"
}

variable "public_ec2_sg_id"{
  type = list(string)
  description = "the pub ec2 sg"
}

variable "private_ec2_sg_id"{
  type = list(string)
  description = "the private ec2 sg"
}