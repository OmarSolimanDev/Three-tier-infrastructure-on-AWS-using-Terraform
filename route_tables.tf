resource "aws_route_table" "public-table" {
  vpc_id = aws_vpc.the-main-vpc.id

  tags = {
    Name = "terra-public-table"
  }
}

resource "aws_route_table" "private-table" {
  vpc_id = aws_vpc.the-main-vpc.id

  tags = {
    Name = "terra-private-table"
  }
}