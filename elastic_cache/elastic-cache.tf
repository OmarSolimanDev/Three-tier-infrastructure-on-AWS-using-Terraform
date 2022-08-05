resource "aws_elasticache_cluster" "redis-elasticache" {
  cluster_id           = "redis-cluster"
  engine               = var.redis_engine_type
  engine_version       = var.redis_engine_version
  node_type            = var.redis_node_type
  num_cache_nodes      = var.redis_no_of_nodes
  parameter_group_name = "default.redis3.2"
  port                 = 6379
  subnet_group_name    = var.redis_subnet_group_name
  security_group_ids   = [var.redis_vpc_security_group]
}
