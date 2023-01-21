provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "S3" {
    bucket   = "kunaldevopsBucket"
    region   = "eu-west-1"
    key      = "terraform.tfstate"
    dynamodb = "kunal.tf"
  }
}

# In this code we are setting the count variable and also the condition that if we are running the code in Dev workspace then there should not be VPC created and if its prod then it should
# create an VPC in prod workspace.
resource "aws_vpc" "Kunal_vpc" {
  count      = terraform.workspace == "Dev" ? 0 : 1
  cidr_block = "var.vpc_cidr"

  tags = {
    Name        = "Kunal_vpc"
    Environment = "${terraform.workspace}"
  }
}