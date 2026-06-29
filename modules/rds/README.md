# RDS Module

Reusable Terraform module to create an AWS RDS instance.

## Features

- Creates a DB subnet group
- Creates a single RDS DB instance
- Supports storage encryption, backups, and optional Performance Insights
- Supports AWS-managed master password in Secrets Manager

## Usage

```hcl
module "rds" {
  source = "../../modules/rds"

  name                   = "app-rds-dev"
  engine                 = "postgres"
  engine_version         = "16.3"
  instance_class         = "db.t4g.micro"
  db_name                = "appdb"
  username               = "appadmin"
  subnet_ids             = ["subnet-abc123", "subnet-def456"]
  vpc_security_group_ids = ["sg-0123456789abcdef0"]

  tags = {
    Environment = "dev"
    Owner       = "platform"
  }
}
```

## Required Inputs

- name
- username
- subnet_ids
- vpc_security_group_ids

## Outputs

- db_instance_identifier
- arn
- endpoint
- address
- port
- resource_id
- master_user_secret_arn
