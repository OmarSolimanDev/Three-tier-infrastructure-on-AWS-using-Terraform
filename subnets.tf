resource "aws_subnet" "public-subnet" {
  vpc_id               = aws_vpc.the-main-vpc.id
  cidr_block           = "10.0.1.0/24"
  availability_zone_id = "use2-az1"
  tags = {
    Name = "terra-public-subnet"
  }
}

resource "aws_subnet" "public-subnet2" {
  vpc_id               = aws_vpc.the-main-vpc.id
  cidr_block           = "10.0.2.0/24"
  availability_zone_id = "use2-az1"

  tags = {
    Name = "terra-public-subnet2"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id               = aws_vpc.the-main-vpc.id
  cidr_block           = "10.0.3.0/24"
  availability_zone_id = "use2-az2"

  tags = {
    Name = "terra-private-subnet"
  }
}

resource "aws_subnet" "private-subnet2" {
  vpc_id               = aws_vpc.the-main-vpc.id
  cidr_block           = "10.0.4.0/24"
  availability_zone_id = "use2-az3"

  tags = {
    Name = "terra-private-subnet"
  }
}
