resource "aws_elasticache_cluster" "redis-elasticache" {
  cluster_id           = "redis-cluster"
  engine               = "redis"
  engine_version       = "3.2.10"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  port                 = 6379
  subnet_group_name    = module.network.redis-subnet-group_name
  security_group_ids   = [aws_security_group.private-redis.id]
}
