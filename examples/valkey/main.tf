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

module "valkey" {
  source = "../../modules/elasticache-valkey"

  name               = var.name
  subnet_ids         = var.subnet_ids
  security_group_ids = var.security_group_ids

  node_type               = var.node_type
  engine_version          = var.engine_version
  replicas_per_node_group = var.replicas_per_node_group
  num_node_groups         = var.num_node_groups

  tags = var.tags
}

output "primary_endpoint" {
  value = module.valkey.primary_endpoint_address
}

output "reader_endpoint" {
  value = module.valkey.reader_endpoint_address
}
