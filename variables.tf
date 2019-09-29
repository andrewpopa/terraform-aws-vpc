# VPC

variable "cidr_block" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_tags" {
  description = "Map fo tags for VPC"
  type        = map
  default = {
    vpc            = "my-aws-vpc"
    public_subnet  = "public-subnet"
    private_subnet = "private-subnet"
    internet_gw    = "my-internet-gateway"
    nat_gateway    = "nat-gateway"
  }
}

variable "vpc_public_subnets" {
  description = "List of public subnets"
  type        = list
  default     = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
}

variable "vpc_private_subnets" {
  description = "List of private subnets"
  type        = list
  default     = ["10.0.15.0/24", "10.0.16.0/24", "10.0.17.0/24"]
}