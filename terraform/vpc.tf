resource "aws_vpc" "main" {
  cidr_block       = "10.4.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = local.vpc_name
  }
}
