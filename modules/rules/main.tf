resource "aws_route53_resolver_rule" "this" {
  name                 = var.name
  domain_name          = var.domain_name
  resolver_endpoint_id = var.resolver_endpoint_id
  rule_type            = var.rule_type

  dynamic "target_ip" {
    for_each = var.target_ips

    content {
      ip   = target_ip.value
      port = var.dns_port
    }
  }
  tags = var.tags
}

resource "aws_route53_resolver_rule_association" "this" {
  for_each         = toset(var.vpcs)
  resolver_rule_id = aws_route53_resolver_rule.this.id
  vpc_id           = each.value
}
