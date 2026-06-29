output "db_instance_identifier" {
  description = "Identifier of the RDS instance."
  value       = aws_db_instance.this.identifier
}

output "arn" {
  description = "ARN of the RDS instance."
  value       = aws_db_instance.this.arn
}

output "endpoint" {
  description = "Connection endpoint in host:port format."
  value       = aws_db_instance.this.endpoint
}

output "address" {
  description = "DNS address of the RDS instance."
  value       = aws_db_instance.this.address
}

output "port" {
  description = "Port exposed by the RDS instance."
  value       = aws_db_instance.this.port
}

output "resource_id" {
  description = "Resource ID of the RDS instance."
  value       = aws_db_instance.this.resource_id
}

output "master_user_secret_arn" {
  description = "Secrets Manager ARN when manage_master_user_password is enabled."
  value       = try(aws_db_instance.this.master_user_secret[0].secret_arn, null)
}
