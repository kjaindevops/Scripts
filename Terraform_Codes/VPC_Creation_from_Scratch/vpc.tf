resource "aws_vpc" "Kunal_VPC" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "dedicated"

  tags = {
    Name = "Kunal_VPC"
  }
}

resource "aws_subnet" "Kunal_Subnet" {
  count      = "3"
  vpc_id     = aws_vpc.Kunal_VPC.id
  cidr_block = cidrsubnet(var.vpc_cidr.8.count.index)

  tags = {
    Name = "Subnet-${count.index + 0}"
  }
}