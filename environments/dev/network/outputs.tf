# # outputs.tf

# output "alb_dns_name" {
#   value = aws_lb.web_lb.dns_name
# }

# output "server1_public_ip" {
#   value = aws_instance.web_server1.public_ip
# }

# output "server2_public_ip" {
#   value = aws_instance.web_server2.public_ip
# }

# output "server1_url" {
#   value = "http://${aws_instance.web_server1.public_ip}"
# }

# output "server2_url" {
#   value = "http://${aws_instance.web_server2.public_ip}"
# }

# output "load_balancer_url" {
#   value = "http://${aws_lb.web_lb.dns_name}"
# }