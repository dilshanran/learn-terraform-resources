terraform { # Terraform block to configure the provider and backend
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.96.0"
    }
  }
}

provider "aws" { # AWS provider configuration  
  region = "us-east-1"
}

resource "aws_subnet" "my_subnet" {
  vpc_id                  = "vpc-005cd965"  # Replace with your VPC ID
  cidr_block              = "172.30.4.0/24"  # Subnet CIDR block
 # availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "MySubnet"
  }
}

resource "aws_instance" "MWFirstEC2" {    # Resource block to create an EC2 instance
  ami                    = "ami-0f88e80871fd81e91" # Amazon Linux 2 AMI
  instance_type          = "t2.micro"
  subnet_id              = "subnet-3d64bf4a"
 # availability_zone      = "us-east-1c"

  tags = {
    Name = "MWFirstEC2"
  }
}
