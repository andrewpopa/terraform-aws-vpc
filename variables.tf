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
    vpc         = "my-aws-vpc"
    subnet      = "subnet"
    internet_gw = "my-internet-gateway"
  }
}

variable "vpc_subnets" {
  description = "List of subnets"
  type        = list
  default     = ["10.0.10.0/24", "10.0.11.0/24", "10.0.12.0/24"]
}