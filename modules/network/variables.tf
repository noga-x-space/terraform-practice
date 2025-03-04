variable "public_subnets" {
  description = "the public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "the private subnets"
  type        = list(string)
}

variable "vpc_cidr" {
  description = "vpc cidr"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
}

