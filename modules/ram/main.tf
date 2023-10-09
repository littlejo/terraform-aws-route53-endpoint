resource "aws_ram_resource_share" "this" {
  count                     = length(var.resource_share_accounts) > 0 ? 1 : 0
  name                      = var.name
  allow_external_principals = false
}

resource "aws_ram_principal_association" "endpoint_ram_principal" {
  for_each           = toset(var.resource_share_accounts)
  principal          = each.value
  resource_share_arn = aws_ram_resource_share.this[0].arn
}

resource "aws_ram_resource_association" "endpoint_ram_resource" {
  count              = length(var.resource_share_accounts) > 0 ? 1 : 0
  resource_arn       = var.resolver_rule_arn
  resource_share_arn = aws_ram_resource_share.this[0].arn
}
