variable "environment" {
  description = "name of current env"
  type        = string
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
}


# variable "public_subnet_ids" {
#   description = "List of public subnet IDs (one per AZ)"
#   type        = list(string)
# }

# variable "vpc_security_group_ids" {
#   description = "List of security group IDs, should match the subnets number"
#   type        = list(string)
# }

# variable "instance_type" {
#   description = "EC2 instance type"
#   type        = string
#   default     = "t2.micro"
# }

# variable "ami_id" {
#   description = "AMI ID for EC2 instances"
#   type        = string
#   default     = "ami-04b4f1a9cf54c11d0"  # Ubuntu AMI
# }
