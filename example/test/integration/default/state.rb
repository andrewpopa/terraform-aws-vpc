describe command('terraform state list') do
  its('stdout') { 
    should eq "module.vpc.data.aws_availability_zones.available\nmodule.vpc.aws_eip.tf_eip\nmodule.vpc.aws_internet_gateway.tf_gw\nmodule.vpc.aws_main_route_table_association.tf_public_route_table\nmodule.vpc.aws_nat_gateway.tf_nat_gw\nmodule.vpc.aws_route_table.tf_private_routing_table\nmodule.vpc.aws_route_table.tf_public_routing_table\nmodule.vpc.aws_route_table_association.tf_private_route_table[0]\nmodule.vpc.aws_route_table_association.tf_private_route_table[1]\nmodule.vpc.aws_route_table_association.tf_private_route_table[2]\nmodule.vpc.aws_route_table_association.tf_public_route_table[0]\nmodule.vpc.aws_route_table_association.tf_public_route_table[1]\nmodule.vpc.aws_route_table_association.tf_public_route_table[2]\nmodule.vpc.aws_subnet.tf_private_subnet[0]\nmodule.vpc.aws_subnet.tf_private_subnet[1]\nmodule.vpc.aws_subnet.tf_private_subnet[2]\nmodule.vpc.aws_subnet.tf_public_subnet[0]\nmodule.vpc.aws_subnet.tf_public_subnet[1]\nmodule.vpc.aws_subnet.tf_public_subnet[2]\nmodule.vpc.aws_vpc.tf_vpc\n"
  }
  its('stderr') { should eq '' }
  its('exit_status') { should eq 0 }
end