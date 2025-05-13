provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "MWwebinstance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  security_groups        = [aws_security_group.web_sg.id]
  subnet_id              = "subnet-3d64bf4a"
  availability_zone      = "us-east-1c"

  tags = {
    Name = "Terraform-Demo-Instance"
  }
}

resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow SSH access"
  vpc_id      = "vpc-005cd965" #sandbox vpc id

  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # You can restrict this to your IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

/*resource "aws_vpc_security_group_ingress_rule" "sshfromyIP" {
  security_group_id = aws_security_group.dove-sg.id
  cidr_ipv4         = "112.135.219.180/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
} */
