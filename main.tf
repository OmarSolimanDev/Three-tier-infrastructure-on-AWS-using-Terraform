module "network" {
  source = "./network"

  region               = var.region
  vpc_cidr             = var.vpc_cidr
  public_subnet1_cidr  = var.public_subnet1_cidr
  public_subnet2_cidr  = var.public_subnet2_cidr
  private_subnet1_cidr = var.private_subnet1_cidr
  private_subnet2_cidr = var.private_subnet2_cidr

}

# --------------  RDS Module --------------
module "rds_db" {
  source = "./rds_db"

  rds_storage           = var.rds_storage
  engine_type           = var.rds_engine_type
  engine_version        = var.rds_engine_version
  instance_class        = var.rds_instance_class
  subnet_group_name     = module.network.rds-subnet-group_name
  vpc_security_group_id = aws_security_group.private-rds.id

}

# --------------  RDS Module --------------

module "elastic_cache" {
  source = "./elastic_cache"

  engine_type              = var.redis_engine_type
  redis_engine_version     = var.redis_engine_version
  redis_node_type          = var.redis_node_type
  no_of_nodes              = var.no_of_nodes
  redis_port               = var.redis_port
  redis_subnet_group_name  = module.network.redis-subnet-group_name
  redis_vpc_security_group = aws_security_group.private-redis.id

}
