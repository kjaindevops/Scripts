provider "aws" {
  region = "eu-west-1"
}
# This code will put your terraform.tfstate file in S3 bucket and now its remotely managed so now you can delete the tfstate local file and the backup file as welll.
# Before running this code we need to create the S3 bucket manually or you can create an python/bash script for creating the S3 bucket.
# You need to run terraform init again for this code to work since it will download/install the plugin required for backend.

terraform {
  backend "s3" {
    bucket = "kunaljainstate"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}

resource "aws_vpc" "Kunal_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "Kunal_vpc"
    Environment = "Dev"
  }
}

output "vpc_cidr" {
  Value = aws_vpc.Kunal_vpc.cidr_block
}
