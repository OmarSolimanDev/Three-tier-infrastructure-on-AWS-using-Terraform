resource "tls_private_key" "mykey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "thekey"
  public_key = tls_private_key.mykey.public_key_openssh

  provisioner "local-exec" { # Create a "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.mykey.private_key_pem}' > ./myKey.pem"
  }

}

output "private_key" {
  value     = tls_private_key.mykey.private_key_pem
  sensitive = true
}
