locals {
  subnet_group_name      = "${var.name}-subnet-group"
  replication_group_name = replace(var.name, "_", "-")
  common_tags = merge(var.tags, {
    Name = var.name
  })
}

resource "aws_elasticache_subnet_group" "this" {
  name        = local.subnet_group_name
  description = "Subnet group for ${var.name}"
  subnet_ids  = var.subnet_ids

  tags = local.common_tags
}

resource "aws_elasticache_replication_group" "this" {
  replication_group_id          = local.replication_group_name
  description                   = var.description
  engine                        = "valkey"
  engine_version                = var.engine_version
  node_type                     = var.node_type
  port                          = var.port
  parameter_group_name          = var.parameter_group_name
  subnet_group_name             = aws_elasticache_subnet_group.this.name
  security_group_ids            = var.security_group_ids
  num_node_groups               = var.num_node_groups
  replicas_per_node_group       = var.replicas_per_node_group
  automatic_failover_enabled    = var.automatic_failover_enabled
  multi_az_enabled              = var.multi_az_enabled
  at_rest_encryption_enabled    = var.at_rest_encryption_enabled
  transit_encryption_enabled    = var.transit_encryption_enabled
  auth_token                    = var.auth_token
  kms_key_id                    = var.kms_key_id
  apply_immediately             = var.apply_immediately
  auto_minor_version_upgrade    = var.auto_minor_version_upgrade
  maintenance_window            = var.maintenance_window
  snapshot_retention_limit      = var.snapshot_retention_limit
  snapshot_window               = var.snapshot_window
  notification_topic_arn        = var.notification_topic_arn

  tags = local.common_tags

  lifecycle {
    precondition {
      condition     = var.replicas_per_node_group > 0 ? var.automatic_failover_enabled : true
      error_message = "automatic_failover_enabled must be true when replicas_per_node_group is greater than 0."
    }
  }
}
