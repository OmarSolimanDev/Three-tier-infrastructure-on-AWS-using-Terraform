resource "aws_vpc" "the-main-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "Terraform-vpc"
  }


}
