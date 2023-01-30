resource "aws_subnet" "KunalPrivateSubnets" {
  count             = length(slice(local.azs_names))
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index)
  vpc_id            = aws_vpc.Kunal_VPC.id
  availability_zone = local.azs_names[count.index]

  tags = {
    Name = "KunalPrivateSubnets-${count.index + 1}"
  }
}