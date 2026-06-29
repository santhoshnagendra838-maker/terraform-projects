# EKS Module

Reusable Terraform module to create an AWS EKS cluster with its own VPC networking.

## What This Module Creates

- VPC
- Public and private subnets across AZs
- Internet Gateway
- NAT Gateway per AZ by default (or single NAT when enabled)
- Public and private route tables with associations
- EKS cluster
- EKS managed node group

## Your 3 Public + 3 Private Requirement

This module supports exactly that pattern by default:

- 3 AZs
- 3 public subnets (one per AZ)
- 3 private subnets (one per AZ)
- 1 IGW
- 3 NAT gateways (one per AZ) when `single_nat_gateway = false`

## Usage

```hcl
module "eks" {
  source = "../../modules/eks"

  name = "platform-eks-dev"

  azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnet_cidrs  = ["10.50.0.0/20", "10.50.16.0/20", "10.50.32.0/20"]
  private_subnet_cidrs = ["10.50.128.0/20", "10.50.144.0/20", "10.50.160.0/20"]

  single_nat_gateway = false

  node_instance_types = ["t3.medium"]
  node_desired_size   = 2
  node_min_size       = 1
  node_max_size       = 3

  tags = {
    Environment = "dev"
    Owner       = "platform"
  }
}
```

## Required Inputs

- name

## Outputs

- vpc_id
- public_subnet_ids
- private_subnet_ids
- internet_gateway_id
- nat_gateway_ids
- cluster_name
- cluster_endpoint
