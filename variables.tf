variable "direction" {
  description = "direction of endpoint"
  type        = string
  default     = "outbound"
}

variable "name" {
  description = "A friendly name lets you easily find your endpoint on the dashboard."
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "All outbound DNS queries will flow through this VPC on the way from other VPCs. You can't change this value after you create an endpoint."
  type        = string
}

variable "create_sg" {
  description = "Do you want to create a sg for that?"
  type        = bool
  default     = true
}

variable "dns_port" {
  description = "DNS port"
  type        = number
  default     = 53
}

variable "cidr_blocks" {
  description = "List of allowed CIDRs. For inbound endpoints, this should be the list of CIDRs allowed to query. For outbound endpoints, this should be the list of DNS servers the endpoint will talk to."
  type        = list(string)
  default     = []
}

variable "sg_name" {
  description = "Security group name"
  type        = string
  default     = "sgr-route53"
}

variable "sg_tags" {
  description = "Security group tags"
  type        = map(string)
  default     = {}
}

variable "sg_ids" {
  description = "Security group ids"
  type        = list(string)
  default     = []
}

variable "ip_addresses" {
  description = "To improve reliability, Resolver requires that you specify two IP addresses for DNS queries. We recommend that you specify IP addresses in two different Availability Zones. After you add the first two IP addresses, you can optionally add more in the same or different Availability Zones."
  type = list(
    object({
      subnet_id = string
      ip        = optional(string)
    })
  )
}

variable "rules" {
  description = "For queries that originate in your VPC, you can define how to forward DNS queries out of the VPC."
  type = map(
    object({
      type                    = optional(string)
      domain_name             = string
      vpcs                    = optional(list(string))
      target_ips              = list(string)
      resource_share_accounts = optional(list(string), [])
    })
  )
  default = {}
}
