variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "name" {
  type    = string
  default = "valkey-dev"
}

variable "subnet_ids" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "node_type" {
  type    = string
  default = "cache.t4g.small"
}

variable "engine_version" {
  type    = string
  default = "7.2"
}

variable "num_node_groups" {
  type    = number
  default = 1
}

variable "replicas_per_node_group" {
  type    = number
  default = 1
}

variable "tags" {
  type = map(string)
  default = {
    Project = "terraform-projects"
  }
}
