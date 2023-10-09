variable "name" {
  type    = string
  default = "sgr-route53"
}

variable "vpc_id" {
  type = string
}

variable "direction" {
  type    = string
  default = "outbound"
}

variable "dns_port" {
  type    = number
  default = 53
}

variable "cidr_blocks" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
