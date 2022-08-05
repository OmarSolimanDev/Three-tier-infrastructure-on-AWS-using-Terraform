resource "aws_route" "igw-public-route" {
  route_table_id         = aws_route_table.public-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
  depends_on             = [aws_route_table.public-table]
}

resource "aws_route" "private-route" {
  route_table_id         = aws_route_table.private-table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.natgw.id
  depends_on             = [aws_route_table.private-table] # table must be created first
}

