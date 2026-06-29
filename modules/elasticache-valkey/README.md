# ElastiCache Valkey Module

Reusable Terraform module to create an AWS ElastiCache Valkey replication group.

## Features

- Creates an ElastiCache subnet group
- Creates a Valkey replication group
- Supports encryption, Multi-AZ, and cluster mode
- Exposes write/read endpoints as outputs

## Usage

```hcl
module "valkey" {
  source = "../../modules/elasticache-valkey"

  name               = "app-valkey-dev"
  subnet_ids         = ["subnet-abc123", "subnet-def456"]
  security_group_ids = ["sg-0123456789abcdef0"]

  node_type               = "cache.t4g.small"
  engine_version          = "7.2"
  replicas_per_node_group = 1

  tags = {
    Environment = "dev"
    Owner       = "platform"
  }
}
```

## Required Inputs

- name
- subnet_ids
- security_group_ids

## Outputs

- replication_group_id
- arn
- primary_endpoint_address
- reader_endpoint_address
- port
- member_clusters
