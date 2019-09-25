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

resource "aws_subnet" "tf_subnet" {
  count             = length(var.vpc_subnets)
  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = var.vpc_subnets[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = join("-", [var.vpc_tags["subnet"], data.aws_availability_zones.available.names[count.index]])
  }
}

resource "aws_internet_gateway" "tf_gw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    Name = var.vpc_tags["internet_gw"]
  }
}

resource "aws_route_table" "tf_routing_table" {
  vpc_id = aws_vpc.tf_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_gw.id
  }
}

resource "aws_main_route_table_association" "tf_route_table" {
  route_table_id = aws_route_table.tf_routing_table.id
  vpc_id         = aws_vpc.tf_vpc.id
}