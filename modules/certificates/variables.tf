
variable "server_private_key_path" {
  description = "Path to the server private key"
  type        = string
}


variable "server_certificate_path" {
  description = "Path to the server certificate (public key)"
  type        = string
}

variable "server_certificate_chain_path" {
  description = "Path to the server certificate chain"
  type        = string
  default     = ""  # Optional: Leave empty if not using certificate chain
}

variable "client_private_key_path" {
  description = "Path to the client private key"
  type        = string
}

variable "client_certificate_path" {
  description = "Path to the client certificate (public key)"
  type        = string
}

variable "client_certificate_chain_path" {
  description = "Path to the client certificate chain"
  type        = string
  default     = ""  # Optional: Leave empty if not using certificate chain
}

variable "root_certificate_path" {
  description = "Path to the root CA certificate"
  type        = string
}

variable "root_private_key_path" {
  description = "Path to the root CA private key (if available)"
  type        = string
  default     = ""  # Optional: Leave empty if you don't have the private key for root CA
}
