variable "environment" {
  description = "name of current env"
  type=string
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
}
