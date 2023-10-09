variable "name" {
  type    = string
  default = "route53-share"
}

variable "resource_share_accounts" {
  type    = list(string)
  default = []
}

variable "resolver_rule_arn" {
  type = string
}
