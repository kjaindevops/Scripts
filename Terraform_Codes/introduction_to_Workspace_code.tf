provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "S3" {
    bucket   = "kunaldevopsBucket"
    region   = "eu-west-1"
    key      = "terraform.tfstate"
    dynamodb = "Kunal.tf"
  }
}

# So in this block if you are running in workspave "Dev", the environment will be "Dev" and if you are running this code in "prod" workspace then it will be created in "prod" workspace.
resource "aws_vpc" "Kunal_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name        = "Kunal_vpc"
    Environment = "${terraform.workspace}"
  }
}

output "vpc_cidr" {
  Value = awc_vpc.Kunal_vpc.cidr_block
}