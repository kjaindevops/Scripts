data "aws_availability_zones" "azs" {
  status = "available"
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