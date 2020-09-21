output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "main_route_table_id" {
  value = module.vpc.main_route_table_id
}
  
output "cidr_block" {
  value = module.vpc.cidr_block
}

