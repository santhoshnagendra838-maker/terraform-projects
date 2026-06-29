output "replication_group_id" {
  description = "ID of the ElastiCache replication group."
  value       = aws_elasticache_replication_group.this.replication_group_id
}

output "arn" {
  description = "ARN of the ElastiCache replication group."
  value       = aws_elasticache_replication_group.this.arn
}

output "primary_endpoint_address" {
  description = "Primary endpoint address for write traffic."
  value       = try(aws_elasticache_replication_group.this.primary_endpoint_address, null)
}

output "reader_endpoint_address" {
  description = "Reader endpoint address for read traffic."
  value       = try(aws_elasticache_replication_group.this.reader_endpoint_address, null)
}

output "port" {
  description = "Port exposed by the replication group."
  value       = aws_elasticache_replication_group.this.port
}

output "member_clusters" {
  description = "Underlying cache cluster IDs for this replication group."
  value       = aws_elasticache_replication_group.this.member_clusters
}
