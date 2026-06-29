variable "name" {
  description = "Base name used for ElastiCache resources."
  type        = string
}

variable "description" {
  description = "Description for the replication group."
  type        = string
  default     = "Managed by Terraform"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ElastiCache subnet group."
  type        = list(string)

  validation {
    condition     = length(var.subnet_ids) > 0
    error_message = "Provide at least one subnet ID."
  }
}

variable "security_group_ids" {
  description = "Security group IDs attached to ElastiCache nodes."
  type        = list(string)

  validation {
    condition     = length(var.security_group_ids) > 0
    error_message = "Provide at least one security group ID."
  }
}

variable "node_type" {
  description = "Instance class used by cache nodes."
  type        = string
  default     = "cache.t4g.small"
}

variable "engine_version" {
  description = "Valkey engine version."
  type        = string
  default     = "7.2"
}

variable "parameter_group_name" {
  description = "Optional ElastiCache parameter group name."
  type        = string
  default     = null
}

variable "port" {
  description = "Port exposed by Valkey."
  type        = number
  default     = 6379
}

variable "num_node_groups" {
  description = "Number of shards (node groups). Keep as 1 for cluster mode disabled."
  type        = number
  default     = 1
}

variable "replicas_per_node_group" {
  description = "Replica count per shard. Use at least 1 for HA."
  type        = number
  default     = 1
}

variable "automatic_failover_enabled" {
  description = "Enable automatic failover for multi-node replication groups."
  type        = bool
  default     = true
}

variable "multi_az_enabled" {
  description = "Enable Multi-AZ deployment."
  type        = bool
  default     = true
}

variable "at_rest_encryption_enabled" {
  description = "Enable encryption at rest."
  type        = bool
  default     = true
}

variable "transit_encryption_enabled" {
  description = "Enable in-transit encryption."
  type        = bool
  default     = true
}

variable "auth_token" {
  description = "Optional auth token used when transit encryption is enabled."
  type        = string
  default     = null
  sensitive   = true
}

variable "kms_key_id" {
  description = "Optional KMS key ARN/ID for encryption at rest."
  type        = string
  default     = null
}

variable "apply_immediately" {
  description = "Apply modifications immediately instead of during maintenance window."
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Enable automatic minor version upgrades."
  type        = bool
  default     = true
}

variable "maintenance_window" {
  description = "Weekly maintenance window (UTC), for example sun:05:00-sun:06:00."
  type        = string
  default     = null
}

variable "snapshot_retention_limit" {
  description = "Number of days to retain automatic snapshots. Set 0 to disable."
  type        = number
  default     = 7
}

variable "snapshot_window" {
  description = "Daily snapshot window (UTC), for example 03:00-04:00."
  type        = string
  default     = null
}

variable "notification_topic_arn" {
  description = "Optional SNS topic ARN for ElastiCache notifications."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags applied to all resources created by this module."
  type        = map(string)
  default     = {}
}
