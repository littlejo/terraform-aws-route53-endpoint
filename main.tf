locals {
  security_group_ids = var.create_sg ? [module.sg[0].id] : var.sg_ids
}

resource "aws_route53_resolver_endpoint" "this" {
  direction          = upper(var.direction)
  security_group_ids = local.security_group_ids
  name               = var.name

  dynamic "ip_address" {
    for_each = var.ip_addresses

    content {
      ip        = ip_address.value.ip
      subnet_id = ip_address.value.subnet_id
    }
  }

  tags = var.tags
}

module "rules" {
  source               = "./modules/rules"
  for_each             = var.rules
  name                 = each.key
  domain_name          = each.value.domain_name
  target_ips           = each.value.target_ips
  resolver_endpoint_id = aws_route53_resolver_endpoint.this.id
  rule_type            = "FORWARD"
  dns_port             = var.dns_port
  vpcs                 = each.value.vpcs
}

module "ram" {
  source                  = "./modules/ram"
  for_each                = var.rules
  name                    = each.key
  resource_share_accounts = each.value.resource_share_accounts
  resolver_rule_arn       = module.rules[each.key].arn
}

module "sg" {
  count       = var.create_sg ? 1 : 0
  source      = "./modules/security-group"
  name        = var.sg_name
  vpc_id      = var.vpc_id
  direction   = var.direction
  dns_port    = var.dns_port
  cidr_blocks = var.cidr_blocks
  tags        = var.sg_tags
}
