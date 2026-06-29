variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "name" {
  type    = string
  default = "platform-eks-dev"
}

variable "kubernetes_version" {
  type    = string
  default = "1.30"
}

variable "vpc_cidr" {
  type    = string
  default = "10.50.0.0/16"
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.50.0.0/20", "10.50.16.0/20", "10.50.32.0/20"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.50.128.0/20", "10.50.144.0/20", "10.50.160.0/20"]
}

variable "single_nat_gateway" {
  type    = bool
  default = false
}

variable "endpoint_public_access" {
  type    = bool
  default = true
}

variable "endpoint_private_access" {
  type    = bool
  default = true
}

variable "node_group_name" {
  type    = string
  default = "default"
}

variable "node_instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}

variable "node_desired_size" {
  type    = number
  default = 2
}

variable "node_min_size" {
  type    = number
  default = 1
}

variable "node_max_size" {
  type    = number
  default = 3
}

variable "node_disk_size" {
  type    = number
  default = 20
}

variable "tags" {
  type = map(string)
  default = {
    Project     = "terraform-projects"
    Environment = "dev"
  }
}
