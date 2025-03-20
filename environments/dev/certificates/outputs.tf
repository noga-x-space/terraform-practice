output "server_cert_arn" {
  description = "ARN of the server certificate"
  value       = module.vpn_certificates.server_cert_arn
}

output "client_cert_arn" {
  description = "ARN of the client certificate"
  value       = module.vpn_certificates.client_cert_arn
}

output "root_cert_arn" {
  description = "ARN of the root certificate"
  value       = module.vpn_certificates.root_cert_arn
}
