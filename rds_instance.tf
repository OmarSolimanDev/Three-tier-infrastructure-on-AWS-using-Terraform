resource "aws_db_instance" "default" {
  allocated_storage      = 10 # 10 GB of storage
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  name                   = "mydb"
  #username               = "omar"
  #password               = 
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  depends_on = [module.network.rds-subnet-group_name]

  db_subnet_group_name   = module.network.rds-subnet-group_name
  multi_az               = false # set to true to have high availability
  vpc_security_group_ids = [aws_security_group.private-rds.id]
}
