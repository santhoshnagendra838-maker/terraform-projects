variable "name" {
  description = "Base name used for RDS resources."
  type        = string
}

variable "engine" {
  description = "RDS engine name (for example postgres or mysql)."
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "Engine version for the selected RDS engine."
  type        = string
  default     = "16.3"
}

variable "instance_class" {
  description = "RDS instance class."
  type        = string
  default     = "db.t4g.micro"
}

variable "allocated_storage" {
  description = "Initial allocated storage in GB."
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "Autoscaling storage upper limit in GB. Set null to disable autoscaling."
  type        = number
  default     = null
}

variable "storage_type" {
  description = "Storage type for the DB instance."
  type        = string
  default     = "gp3"
}

variable "storage_encrypted" {
  description = "Enable encryption at rest."
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "Optional KMS key ARN/ID used for storage encryption."
  type        = string
  default     = null
}

variable "db_name" {
  description = "Optional initial database name."
  type        = string
  default     = null
}

variable "username" {
  description = "Master username for the DB instance."
  type        = string
}

variable "password" {
  description = "Master password. Required only when manage_master_user_password is false."
  type        = string
  default     = null
  sensitive   = true
}

variable "manage_master_user_password" {
  description = "Let AWS Secrets Manager manage the master password."
  type        = bool
  default     = true
}

variable "port" {
  description = "Database port. Set null to use engine default."
  type        = number
  default     = null
}

variable "multi_az" {
  description = "Enable Multi-AZ deployment."
  type        = bool
  default     = false
}

variable "publicly_accessible" {
  description = "Whether the DB instance has a public IP."
  type        = bool
  default     = false
}

variable "subnet_ids" {
  description = "Subnet IDs used for the DB subnet group."
  type        = list(string)

  validation {
    condition     = length(var.subnet_ids) > 0
    error_message = "Provide at least one subnet ID."
  }
}

variable "vpc_security_group_ids" {
  description = "Security group IDs attached to the DB instance."
  type        = list(string)

  validation {
    condition     = length(var.vpc_security_group_ids) > 0
    error_message = "Provide at least one security group ID."
  }
}

variable "parameter_group_name" {
  description = "Optional DB parameter group name."
  type        = string
  default     = null
}

variable "option_group_name" {
  description = "Optional DB option group name."
  type        = string
  default     = null
}

variable "backup_retention_period" {
  description = "Number of days to retain backups."
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "Preferred backup window in UTC."
  type        = string
  default     = null
}

variable "maintenance_window" {
  description = "Preferred maintenance window in UTC."
  type        = string
  default     = null
}

variable "deletion_protection" {
  description = "Enable deletion protection."
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot when destroying the instance."
  type        = bool
  default     = true
}

variable "final_snapshot_identifier" {
  description = "Final snapshot identifier when skip_final_snapshot is false."
  type        = string
  default     = null
}

variable "apply_immediately" {
  description = "Apply changes immediately instead of the next maintenance window."
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Enable automatic minor version upgrades."
  type        = bool
  default     = true
}

variable "performance_insights_enabled" {
  description = "Enable Performance Insights."
  type        = bool
  default     = false
}

variable "performance_insights_kms_key_id" {
  description = "Optional KMS key ARN/ID for Performance Insights data encryption."
  type        = string
  default     = null
}

variable "performance_insights_retention_period" {
  description = "Performance Insights retention in days."
  type        = number
  default     = 7
}

variable "tags" {
  description = "Tags applied to all resources created by this module."
  type        = map(string)
  default     = {}
}
