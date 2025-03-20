
# Import Server Certificate
resource "aws_acm_certificate" "server_cert" {
  private_key      = file(var.server_private_key_path)  # Path to your server private key
  certificate_body = file(var.server_certificate_path)  # Path to your server certificate (public key)
}

# Import Client Certificate
resource "aws_acm_certificate" "client_cert" {
  private_key      = file(var.client_private_key_path)  # Path to your client private key
  certificate_body = file(var.client_certificate_path)  # Path to your client certificate (public key)
  # certificate_chain = file(var.client_certificate_chain_path)  # Path to the client certificate chain
}

# Import Root CA Certificate
resource "aws_acm_certificate" "root_cert" {
  certificate_body = file(var.root_certificate_path)  # Path to your root CA certificate
  private_key      = file(var.root_private_key_path)   # Path to your CA private key (if available)
}

