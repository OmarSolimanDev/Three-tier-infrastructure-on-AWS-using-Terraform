output "vpc_id" {
  value = aws_vpc.the-main-vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.the-main-vpc.cidr_block
}


output "public_subnet-1_id" {
  value = aws_subnet.public-subnet.id
}

output "public_subnet-2_id" {
  value = aws_subnet.public-subnet2.id
}

output "private_subnet-1_id" {
  value = aws_subnet.private-subnet.id
}

output "private_subnet-2_id" {
  value = aws_subnet.private-subnet2.id
}

output "rds-subnet-group_name" {
  value = aws_db_subnet_group.db_private-subnet_group.name
}
output "redis-subnet-group_name" {
  value = aws_elasticache_subnet_group.elastic-cache-subnet-group.name
}
