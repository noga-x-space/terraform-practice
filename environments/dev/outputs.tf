# output "instance_public_ip" {
#   description = "Public IP of the EC2 instance"
#   value       = aws_instance.web_server.public_ip
# }

# output "vpc_id" {
#   description = "ID of the VPC"
#   value       = aws_vpc.main.id
# }

# output "web_server_public_ip" {
#   value = aws_instance.web_server.public_ip
# }

# output "web_server_url" {
#   value = "http://${aws_instance.web_server.public_ip}"
# }