data "aws_availability_zones" "azs" {
  state = "available"
}

locals {
  azs_names = data.aws_availability_zones.azs.names
}

resource "aws_subnet" "KunalPublicSubnet" {
  count             = length(local.azs_names)
  vpc_id            = aws_vpc.Kunal_VPC.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone = local.azs_names[count.index]

  tags = {
    Name = "KunalPublicSubnet-${count.index + 1}"
  }

}

resource "aws_internet_gateway" "KunalIGW" {
  vpc_id = aws_vpc.Kunal_VPC.id

  tags = {
    Name = "KunalIGW"
  }

}

resource "aws_route_table" "KunalPublicRouteTable" {
  vpc_id = aws_vpc.Kunal_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.KunalIGW.id
  }

  tags = {
    Name = "KunalPublicRouteTable"
  }

}