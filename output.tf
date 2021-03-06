output "vpc_id" {
  description = "The ID of the VPC"
  value       = join("", aws_vpc.tf_vpc.*.id)
}

output "public_subnets" {
  description = "List of public subnets assigned to VPC"
  value       = aws_subnet.tf_public_subnet.*.id
}

output "private_subnets" {
  description = "List of private subnets assigned to VPC"
  value       = aws_subnet.tf_private_subnet.*.id
}

output "owner_id" {
  description = "Id of AWS account for VPC"
  value = aws_vpc.tf_vpc.owner_id
}

output "main_route_table_id" {
  description = "Main route table ID"
  value = aws_vpc.tf_vpc.main_route_table_id
}

output "cidr_block" {
  description = "CIDR block"
  value = aws_vpc.tf_vpc.cidr_block
}
