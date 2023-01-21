provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {
    key      = "terraform.tfstate"
    bucket   = "kunaldevopsbucket"
    region   = "eu-west-1"
    dynamodb = "kunal.tf"
  }
}

# In this block we have given the variable refference to the cidr_block output and asked terraform to look for the vailables in different file.
resource "aws_vpc" "Kunal_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = "Kunal_vpc"
    Environment = "Dev"
  }
}

output "vpc_cidr" {
  value = aws_vpc.Kunal_vpc.cidr_block
}