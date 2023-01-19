provider "aws" {
  region = "eu-west-1"
}

# This block will create an locking while you are using this code or anyone who is using this code. Before that you shoud create an DynamoDB table from AWS console and add "LockID" under the Partition Key.
terraform {
  backend "S3" {
    bucket         = "kunalbucketdev"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "Kunal_tf"
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