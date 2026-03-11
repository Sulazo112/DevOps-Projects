resource "aws_db_subnet_group" "this" {
  name       = "${var.project_name}-db-subnet-group"
  subnet_ids = var.private_subnet_ids

  tags = merge(
    var.tags,
    { Name = "${var.project_name}-db-subnet-group" }
  )
}

resource "aws_db_instance" "this" {
  identifier              = "${var.project_name}-db"
  allocated_storage       = var.allocated_storage
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = var.instance_class
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.rds_password
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [var.security_group_id]
  skip_final_snapshot     = true
  publicly_accessible     = false
  multi_az                = var.multi_az

  tags = merge(
    var.tags,
    { Name = "${var.project_name}-db" }
  )
}

output "db_endpoint" {
  value = aws_db_instance.this.endpoint
}

output "db_name" {
  value = var.db_name
}

output "db_username" {
  value = var.db_username
}

