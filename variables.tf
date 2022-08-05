variable "region" {
  type = string
}
variable "vpc_cidr" {
  type = string

}

variable "public_subnet1_cidr" {
  type = string
}

variable "public_subnet2_cidr" {
  type = string
}

variable "private_subnet1_cidr" {
  type = string
}


variable "private_subnet2_cidr" {
  type = string
}
# ---------------- RDS Variables ----------------
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
  type = string
}
# ---------------- redis variables ----------------

variable "redis_engine_type" {
  type = string
}
variable "redis_engine_version" {
  type = string
}
variable "redis_node_type" {
  type = string
}
variable "redis_no_of_nodes" {
  type        = string
}
variable "redis_port" {
  type = string
}
