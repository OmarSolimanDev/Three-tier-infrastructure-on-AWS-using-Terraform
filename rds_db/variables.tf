variable "rds_storage" {
  type = string
}
variable "engine_type" {
  type = string
}
variable "engine_version" {
  type = string
}
variable "instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "subnet_group_name" {
  type = string
  description = "subnet group for rds db"
}

variable "vpc_security_group_id" {
    type = string
}