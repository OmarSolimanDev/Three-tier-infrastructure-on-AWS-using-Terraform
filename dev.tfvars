# ---------------- Default region to deploy the infrastucture ----------------
region = "us-east-2"

vpc_cidr             = "172.16.0.0/16"
public_subnet1_cidr  = "172.16.0.0/24" # puplic subnet 1
public_subnet2_cidr  = "172.16.1.0/24" # puplic subnet 2
private_subnet1_cidr = "172.16.2.0/24" # private subnet 1
private_subnet2_cidr = "172.16.3.0/24" # private subnet 1

# ---------------- RDS Variables ----------------

rds_storage        = "10" # 10 GB of storage 
rds_engine_type    = "mysql"
rds_engine_version = "5.7"
rds_instance_class = "db.t3.micro"

# ---------------- Elastic Cache ----------------

redis_engine_type    = "redis"
redis_engine_version = "3.2.10"
redis_node_type      = "cache.t2.micro"
no_of_nodes          = "1"
redis_port           = "6379"
