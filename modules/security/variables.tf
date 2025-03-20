variable "vpc_id" {
  description = "id of the vpc"
  type        = string
}
variable "environment" {
  description = "Environment name"
  type        = string
}

# Variable to control whether ALB SG is created
variable "create_alb_sg" {
  description = "Should the ALB security group be created?"
  type        = bool
  default     = false  
}

//by default, it loops through all the private subnets
variable "private_subnets" {
  description = "the private subnets"
  type        = list(string)
}