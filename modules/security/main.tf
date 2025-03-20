//// by default, the alb sg isnt created! control through vars

# Security Group for Public EC2
resource "aws_security_group" "public_ec2_sg" {

  name        = "ec2-public-sg"
  description = "Security group for EC2 instance"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "0"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-public-ec2-sg"
    Environment = var.environment
  }
}

# Security Group for Private EC2
resource "aws_security_group" "private_ec2_sg" {

  name        = "ec2-private-sg"
  description = "Security group for EC2 instance"
  vpc_id      = var.vpc_id

  # Allow traffic from other private subnets in the VPC
  ingress {
    description = "Allow traffic from other private subnets"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"  # Allow all protocols (TCP, UDP, etc.)
    cidr_blocks = var.private_subnets  # Allow from private subnets
  }
  
  # ingress {
  #   description = "SSH from anywhere"
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # Allow traffic from VPN clients (VPN SG)
  ingress {
    description = "Allow VPN traffic"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/22"]  # VPN client CIDR block
  }

  # Allow outbound traffic to the internet via NAT Gateway
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-private-ec2-sg"
    Environment = var.environment
  }
}

# Security Group for ALB
#is conditionally rendered if the "create_alb_sg" var is set to True.
resource "aws_security_group" "alb_sg" {
  count =  var.create_alb_sg ? 1 : 0 
  name   = "alb-security-group"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-alb-sg"
    Environment = var.environment
  }
}

# Security group for private vpc

resource "aws_security_group" "vpn_access" {
  name        = "vpn-access"
  description = "Allow access from VPN"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]  # Allow access from the entire VPC (your VPN clients)
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  
  tags = {
    Name        = "${var.environment}-vpn-sg"
    Environment = var.environment
  }
}
