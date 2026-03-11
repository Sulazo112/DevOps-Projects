resource "aws_efs_file_system" "this" {
  creation_token   = "${var.project_name}-efs"
  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode
  encrypted        = true

  tags = merge(
    var.tags,
    { Name = "${var.project_name}-efs" }
  )
}

resource "aws_efs_mount_target" "mt" {
  for_each = {
    for idx, subnet in var.subnet_ids :
    idx => subnet
  }

  file_system_id  = aws_efs_file_system.this.id
  subnet_id       = each.value
  security_groups = var.security_group_ids
}

data "aws_efs_file_system" "dns" {
  file_system_id = aws_efs_file_system.this.id
}

