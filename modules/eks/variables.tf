variable "name" {
  description = "Base name used for EKS and networking resources."
  type        = string
}

variable "kubernetes_version" {
  description = "EKS Kubernetes version."
  type        = string
  default     = "1.30"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC created by this module."
  type        = string
  default     = "10.50.0.0/16"
}

variable "azs" {
  description = "Availability zones to use. Keep 3 AZs for 3 public + 3 private subnets."
  type        = list(string)
  default     = []
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs, one per AZ."
  type        = list(string)
  default     = ["10.50.0.0/20", "10.50.16.0/20", "10.50.32.0/20"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs, one per AZ."
  type        = list(string)
  default     = ["10.50.128.0/20", "10.50.144.0/20", "10.50.160.0/20"]
}

variable "single_nat_gateway" {
  description = "Use a single NAT gateway for all private subnets to reduce cost."
  type        = bool
  default     = false
}

variable "endpoint_public_access" {
  description = "Enable public endpoint access for the EKS control plane."
  type        = bool
  default     = true
}

variable "endpoint_private_access" {
  description = "Enable private endpoint access for the EKS control plane."
  type        = bool
  default     = true
}

variable "node_group_name" {
  description = "Name for the default managed node group."
  type        = string
  default     = "default"
}

variable "node_instance_types" {
  description = "EC2 instance types for EKS managed nodes."
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_desired_size" {
  description = "Desired node count for the managed node group."
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum node count for the managed node group."
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum node count for the managed node group."
  type        = number
  default     = 3
}

variable "node_disk_size" {
  description = "Disk size in GiB for each worker node."
  type        = number
  default     = 20
}

variable "tags" {
  description = "Tags applied to resources created by this module."
  type        = map(string)
  default     = {}
}
