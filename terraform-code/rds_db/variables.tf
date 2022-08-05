variable "rds_storage" {
  type = string
}
variable "rds_engine_type" {
  type = string
}
variable "rds_engine_version" {
  type = string
}
variable "rds_instance_class" {
  type    = string
  default = "db.t3.micro"
}

variable "rds_subnet_group_name" {
  type = string
  description = "subnet group for rds db"
}

variable "rds_vpc_security_group_id" {
    type = string
}