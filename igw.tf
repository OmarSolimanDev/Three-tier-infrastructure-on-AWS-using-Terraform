resource "aws_internet_gateway" "igw" {
 vpc_id     = aws_vpc.the-main-vpc.id
  tags = {
    Name = "terra igw"
  }
}
