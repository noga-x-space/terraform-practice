
# EC2 Instances
resource "aws_instance" "web_server" {
  count                       = length(var.availability_zones)
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_ids[count.index]
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = true
  user_data_replace_on_change = true

  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y apache2
    echo "<h1>Hello from Server ${count.index + 1} in ${var.availability_zones[count.index]}</h1>" > /var/www/html/index.html
    systemctl start apache2
    systemctl enable apache2
    EOF

  tags = {
    Name        = "${var.environment}-web-server-${count.index}-${var.availability_zones[count.index]}"
    Environment = var.environment
    AZ          = var.availability_zones[count.index]
  }
}