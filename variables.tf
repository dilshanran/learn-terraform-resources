variable "aws_region" {
  description = "AWS region to deploy to"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the instance"
  default     = "ami-0c55b159cbfafe1f0" # Update if needed
}

variable "key_name" {
  description = "Name of the AWS key pair"
  type        = string
}
