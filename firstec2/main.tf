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

resource "aws_instance" "MWFirstEC2" { # Resource block to create an EC2 instance
  ami           = "ami-0f88e80871fd81e91" # Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "MWFirstEC2"
  }
}
