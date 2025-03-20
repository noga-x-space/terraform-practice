
# ./modules/vpn_certificates/variables.tf

variable "server_private_key_path" {
  type        = string
  description = "Path to the server private key."
}

variable "server_certificate_path" {
  type        = string
  description = "Path to the server certificate."
}

variable "client_private_key_path" {
  type        = string
  description = "Path to the client private key."
}

variable "client_certificate_path" {
  type        = string
  description = "Path to the client certificate."
}

variable "root_certificate_path" {
  type        = string
  description = "Path to the root certificate."
}

variable "root_private_key_path" {
  type        = string
  description = "Path to the root certificate private key."
}
