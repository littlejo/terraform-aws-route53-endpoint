resource "aws_security_group" "this" {
  name   = var.name
  vpc_id = var.vpc_id

  lifecycle {
    create_before_destroy = true
  }
  tags = { Name = var.name }
}

resource "aws_security_group_rule" "endpoint_dns_udp" {
  for_each = toset(["udp", "tcp"])
  protocol = each.value

  type              = var.direction == "inbound" ? "ingress" : "egress"
  from_port         = var.dns_port
  to_port           = var.dns_port
  cidr_blocks       = var.cidr_blocks
  security_group_id = aws_security_group.this.id
}
