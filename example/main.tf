module "vpc" {
  source = "github.com/andrewpopa/terraform-aws-vpc"

  # VPC
  cidr_block = "172.16.0.0/16"
  vpc_subnets = ["172.16.10.0/24", "172.16.11.0/24", "172.16.12.0/24"] 
  vpc_tags = {
    vpc         = "my-aws-vpc"
    subnet      = "subnet"
    internet_gw = "my-internet-gateway"
  }
}
