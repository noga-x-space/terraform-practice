
module "vpn_certificates" {
  source = "../../../modules/certificates"

  server_private_key_path = var.server_private_key_path
  server_certificate_path = var.server_certificate_path
  client_private_key_path = var.client_private_key_path
  client_certificate_path = var.client_certificate_path
  root_certificate_path   = var.root_certificate_path
  root_private_key_path   = var.root_private_key_path
}

