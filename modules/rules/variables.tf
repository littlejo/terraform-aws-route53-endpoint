variable "name" {
  type = string
}

variable "domain_name" {
  type = string
}

variable "resolver_endpoint_id" {
  type = string
}

variable "rule_type" {
  type = string
}

variable "target_ips" {
  type = list(string)
}

variable "dns_port" {
  type    = number
  default = 53
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vpcs" {
  type    = list(string)
  default = []
}
