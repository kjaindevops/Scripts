# This block will install the plugin for AWS
provider "aws" {
  region = "us-east-1"
}

# This block will create the VPC in AWS
resource "aws_vpc" "Kunal_vpc" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Kunal_vpc"
  }
}

# This block will provide the output of the desired resource value
output "vpc_cidr" {
  value = aws_vpc.Kunal_vpc.cidr_block
}