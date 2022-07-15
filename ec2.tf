
resource "aws_instance" "bastion-server" {
  ami           = data.aws_ami.myubuntu.id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  subnet_id     = aws_subnet.public-subnet.id
  key_name      = aws_key_pair.generated_key.key_name

  security_groups = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "Bastion Server"
  }
}


resource "aws_instance" "app_server" {
  ami           = data.aws_ami.myubuntu.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private-subnet.id
  key_name      = aws_key_pair.generated_key.key_name

  security_groups = [aws_security_group.private-ssh.id]
  tags = {
    Name = "App Server"
  }
}
