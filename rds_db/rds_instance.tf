resource "aws_db_instance" "default" {
  allocated_storage = var.rds_storage # 10 GB of storage
  engine            = var.rds_engine_type
  engine_version    = var.rds_engine_version
  instance_class    = var.rds_instance_class
  db_name           = "my_rds"
  #username               = "omar"
  #password               = 
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  depends_on             = [var.rds_subnet_group_name]
  db_subnet_group_name   = var.rds_subnet_group_name
  multi_az               = false # set to true to have high availability
  vpc_security_group_ids = [var.rds_vpc_security_group_id]
}
