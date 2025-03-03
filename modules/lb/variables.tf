variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where ALB will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for ALB"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for ALB"
  type        = list(string)
}

variable "instance_ids" {
  description = "List of EC2 instance IDs to attach to target group"
  type        = list(string)
}

# variable "target_group_port" {
#   description = "Port for target group"
#   type        = number
#   default     = 80
# }
