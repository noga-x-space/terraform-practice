variable "environment" {
  description = "name of current env"
  type        = string
}
variable "vpc_cidr" {
  description = "the cide"
  type        = string
}

variable "public_subnets" {
  description = "the public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "the private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
}
