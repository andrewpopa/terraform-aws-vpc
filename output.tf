output "vpc_id" {
  description = "The ID of the VPC"
  value       = join("", aws_vpc.tf_vpc.*.id)
}

output "sub_wildcard" {
  description = "List of subnets assigned to VPC"
  value       = aws_subnet.tf_subnet.*.id
}
