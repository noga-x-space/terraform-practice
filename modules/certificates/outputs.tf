# ./modules/vpn_certificates/outputs.tf

output "server_cert_arn" {
  description = "ARN of the server certificate"
  value       = aws_acm_certificate.server_cert.arn
}

output "client_cert_arn" {
  description = "ARN of the client certificate"
  value       = aws_acm_certificate.client_cert.arn
}

output "root_cert_arn" {
  description = "ARN of the root certificate"
  value       = aws_acm_certificate.root_cert.arn
}

