resource "aws_db_instance" "default" {
  allocated_storage      = var.rds_storage # 10 GB of storage
  engine                 = var.engine_type
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  name                   = "mydb"
  #username               = "omar"
  #password               = 
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  depends_on = [var.subnet_group_name]

  db_subnet_group_name   = var.subnet_group_name
  multi_az               = false # set to true to have high availability
  vpc_security_group_ids = [var.vpc_security_group_id]
}
