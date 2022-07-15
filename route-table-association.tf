resource "aws_route_table_association" "rt-public-association-1" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public-table.id
}
resource "aws_route_table_association" "rt-public-association-2" {
  subnet_id      = aws_subnet.public-subnet2.id
  route_table_id = aws_route_table.public-table.id
}

resource "aws_route_table_association" "rt-private-association-1" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.private-table.id
}

resource "aws_route_table_association" "rt-private-association-2" {
  subnet_id      = aws_subnet.private-subnet2.id
  route_table_id = aws_route_table.private-table.id
}