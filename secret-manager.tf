resource "aws_secretsmanager_secret" "secret" {
  name = "myprivatesecrete1"

  rotation_rules {
    automatically_after_days = 0
  }

}


resource "aws_secretsmanager_secret_version" "sversion" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = tls_private_key.mykey.private_key_pem
}
