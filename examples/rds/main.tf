terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "rds" {
  source = "../../modules/rds"

  name                   = var.name
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  db_name                = var.db_name
  username               = var.username
  subnet_ids             = var.subnet_ids
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = var.tags
}

output "rds_endpoint" {
  value = module.rds.endpoint
}

output "rds_secret_arn" {
  value = module.rds.master_user_secret_arn
}
