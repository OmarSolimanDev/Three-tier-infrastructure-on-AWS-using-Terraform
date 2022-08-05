resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.the-main-vpc.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = "${var.region}a"
  tags = {
    Name = "terra-public-subnet"
  }
}

resource "aws_subnet" "public-subnet2" {
  vpc_id            = aws_vpc.the-main-vpc.id
  cidr_block        = var.public_subnet2_cidr
  availability_zone = "${var.region}a"

  tags = {
    Name = "terra-public-subnet2"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.the-main-vpc.id
  cidr_block = var.private_subnet1_cidr

  availability_zone = "${var.region}b"
  tags = {
    Name = "terra-private-subnet"
  }
}

resource "aws_subnet" "private-subnet2" {
  vpc_id            = aws_vpc.the-main-vpc.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = "${var.region}c"

  tags = {
    Name = "terra-private-subnet"
  }
}
resource "aws_db_subnet_group" "db_private-subnet_group" {
  name       = "db_subnet_group"
  subnet_ids = [aws_subnet.private-subnet.id,aws_subnet.private-subnet2.id]
  tags = {
    Name = "terra-rds-subnet-Group"
  }
}

resource "aws_elasticache_subnet_group" "elastic-cache-subnet-group" {
  name       = "cache-subnet-group"
  subnet_ids = [aws_subnet.private-subnet.id,aws_subnet.private-subnet2.id]
  tags = {
    Name = "terra-elasticCache-subnet-Group"
  }
}