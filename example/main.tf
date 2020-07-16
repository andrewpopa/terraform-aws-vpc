module "vpc" {
  source = "../"

  # VPC
  cidr_block          = "172.16.0.0/16"
  vpc_public_subnets  = ["172.16.10.0/24", "172.16.11.0/24", "172.16.12.0/24"]
  vpc_private_subnets = ["172.16.13.0/24", "172.16.14.0/24", "172.16.15.0/24"]
  availability_zones  = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
  vpc_tags = {
    vpc            = "my-aws-vpc"
    public_subnet  = "public-subnet"
    private_subnet = "private-subnet"
    internet_gw    = "my-internet-gateway"
    nat_gateway    = "nat-gateway"
  }

  providers = {
    aws = aws
  }
}


module "vpc2" {
  source = "../"

  # VPC
  availability_zones = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  vpc_tags = {
    vpc            = "my-aws-vpc1"
    public_subnet  = "public-subnet1"
    private_subnet = "private-subnet1"
    internet_gw    = "my-internet-gateway1"
    nat_gateway    = "nat-gateway1"
  }

  providers = {
    aws = aws.eu-north-1
  }
}