
resource "aws_instance" "bastion-server" {
  ami                         = data.aws_ami.myubuntu.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  subnet_id                   = module.network.public_subnet-1_id
  key_name                    = aws_key_pair.generated_key.key_name

  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  provisioner "local-exec" {
    command = "echo ${self.public_ip}"
  }
  provisioner "local-exec" {
    command = "echo ${self.private_ip}"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_dns}"
  }
  tags = {
    Name = "Bastion Server"
  }
}

resource "aws_instance" "app_server" {
  ami           = data.aws_ami.myubuntu.id
  instance_type = "t2.micro"
  subnet_id     = module.network.private_subnet-1_id
  key_name      = aws_key_pair.generated_key.key_name

  vpc_security_group_ids = [aws_security_group.private-ssh.id]
  tags = {
    Name = "App Server"
  }
}
