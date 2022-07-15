resource "aws_vpc" "the-main-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "terra-vpc"
  }


}
