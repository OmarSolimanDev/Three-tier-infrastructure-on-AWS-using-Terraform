variable "engine_type" {
  type = string
}

variable "redis_engine_version" {
  type = string
}

variable "redis_node_type" {
  type = string
}

variable "no_of_nodes" {
  type        = string
  description = "number of redis nodes"

}

variable "redis_port" {
    type = string
  
}

variable "subnet_group_name" {
  type        = string
  description = "subnet group for redis"
}

variable "redis_vpc_security_group" {
  type = string
}
