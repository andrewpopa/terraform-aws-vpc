# VPC
resource "aws_vpc" "tf_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = var.vpc_tags["vpc"]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "tf_public_subnet" {
  count             = length(var.vpc_public_subnets)
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.vpc_public_subnets[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = join("-", [var.vpc_tags["public_subnet"], data.aws_availability_zones.available.names[count.index]])
  }
}

resource "aws_subnet" "tf_private_subnet" {
  count             = length(var.vpc_private_subnets)
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.vpc_private_subnets[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = join("-", [var.vpc_tags["private_subnet"], data.aws_availability_zones.available.names[count.index]])
  }
}

resource "aws_internet_gateway" "tf_gw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    Name = var.vpc_tags["internet_gw"]
  }
}

resource "aws_route_table" "tf_public_routing_table" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_gw.id
  }
  tags = {
    Name = var.vpc_tags["public_subnet"]
  }
}

resource "aws_route_table" "tf_private_routing_table" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.tf_nat_gw.id
  }
  tags = {
    Name = var.vpc_tags["private_subnet"]
  }
}

resource "aws_route_table_association" "tf_public_route_table" {
  count          = length(var.vpc_public_subnets)
  subnet_id      = element(aws_subnet.tf_public_subnet.*.id, count.index)
  route_table_id = aws_route_table.tf_public_routing_table.id
}

resource "aws_route_table_association" "tf_private_route_table" {
  count          = length(var.vpc_private_subnets)
  subnet_id      = element(aws_subnet.tf_private_subnet.*.id, count.index)
  route_table_id = aws_route_table.tf_private_routing_table.id
}

resource "aws_main_route_table_association" "tf_public_route_table" {
  route_table_id = aws_route_table.tf_public_routing_table.id
  vpc_id         = aws_vpc.tf_vpc.id
}

# NAT
resource "aws_eip" "tf_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.tf_gw]
}

resource "aws_nat_gateway" "tf_nat_gw" {
  allocation_id = aws_eip.tf_eip.id
  subnet_id     = aws_subnet.tf_public_subnet.*.id[0]

  tags = {
    Name = var.vpc_tags["nat_gateway"]
  }
}