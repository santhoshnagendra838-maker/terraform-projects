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

module "eks" {
  source = "../../modules/eks"

  name               = var.name
  kubernetes_version = var.kubernetes_version
  vpc_cidr           = var.vpc_cidr

  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs

  single_nat_gateway      = var.single_nat_gateway
  endpoint_public_access  = var.endpoint_public_access
  endpoint_private_access = var.endpoint_private_access

  node_group_name     = var.node_group_name
  node_instance_types = var.node_instance_types
  node_desired_size   = var.node_desired_size
  node_min_size       = var.node_min_size
  node_max_size       = var.node_max_size
  node_disk_size      = var.node_disk_size

  tags = var.tags
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "eks_endpoint" {
  value = module.eks.cluster_endpoint
}

output "vpc_id" {
  value = module.eks.vpc_id
}

output "public_subnet_ids" {
  value = module.eks.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.eks.private_subnet_ids
}
