terraform {
  backend "s3" {
    bucket         = "terraform-iti-bucket"
    key            = "./state/"
    region         = "us-east-2"
    dynamodb_table = "state-locker" # name of the dynamodb table
  }
}
