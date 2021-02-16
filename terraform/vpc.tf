resource "aws_vpc" "main" {
  cidr_block       = local.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = local.vpc_name
  }
}
