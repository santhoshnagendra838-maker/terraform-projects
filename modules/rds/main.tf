locals {
  identifier = lower(replace(var.name, "_", "-"))
  common_tags = merge(var.tags, {
    Name = var.name
  })
}

resource "aws_db_subnet_group" "this" {
  name        = "${local.identifier}-subnet-group"
  description = "Subnet group for ${var.name}"
  subnet_ids  = var.subnet_ids

  tags = local.common_tags
}

resource "aws_db_instance" "this" {
  identifier                            = local.identifier
  engine                                = var.engine
  engine_version                        = var.engine_version
  instance_class                        = var.instance_class
  allocated_storage                     = var.allocated_storage
  max_allocated_storage                 = var.max_allocated_storage
  storage_type                          = var.storage_type
  storage_encrypted                     = var.storage_encrypted
  kms_key_id                            = var.kms_key_id
  db_name                               = var.db_name
  username                              = var.username
  password                              = var.manage_master_user_password ? null : var.password
  manage_master_user_password           = var.manage_master_user_password
  port                                  = var.port
  multi_az                              = var.multi_az
  publicly_accessible                   = var.publicly_accessible
  db_subnet_group_name                  = aws_db_subnet_group.this.name
  vpc_security_group_ids                = var.vpc_security_group_ids
  parameter_group_name                  = var.parameter_group_name
  option_group_name                     = var.option_group_name
  backup_retention_period               = var.backup_retention_period
  backup_window                         = var.backup_window
  maintenance_window                    = var.maintenance_window
  deletion_protection                   = var.deletion_protection
  skip_final_snapshot                   = var.skip_final_snapshot
  final_snapshot_identifier             = var.final_snapshot_identifier
  apply_immediately                     = var.apply_immediately
  auto_minor_version_upgrade            = var.auto_minor_version_upgrade
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_kms_key_id       = var.performance_insights_kms_key_id
  performance_insights_retention_period = var.performance_insights_retention_period

  tags = local.common_tags

  lifecycle {
    precondition {
      condition     = var.manage_master_user_password || var.password != null
      error_message = "Set password when manage_master_user_password is false."
    }

    precondition {
      condition     = var.skip_final_snapshot || var.final_snapshot_identifier != null
      error_message = "Set final_snapshot_identifier when skip_final_snapshot is false."
    }
  }
}
