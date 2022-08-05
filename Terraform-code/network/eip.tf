resource "aws_eip" "static-ip" {

  depends_on                = [aws_internet_gateway.igw]
}