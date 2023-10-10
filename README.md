<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.20.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ram"></a> [ram](#module\_ram) | ./modules/ram | n/a |
| <a name="module_rules"></a> [rules](#module\_rules) | ./modules/rules | n/a |
| <a name="module_sg"></a> [sg](#module\_sg) | ./modules/security-group | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_route53_resolver_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_resolver_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_blocks"></a> [cidr\_blocks](#input\_cidr\_blocks) | List of allowed CIDRs. For inbound endpoints, this should be the list of CIDRs allowed to query. For outbound endpoints, this should be the list of DNS servers the endpoint will talk to. | `list(string)` | `[]` | no |
| <a name="input_create_sg"></a> [create\_sg](#input\_create\_sg) | Do you want to create a sg for that? | `bool` | `true` | no |
| <a name="input_direction"></a> [direction](#input\_direction) | direction of endpoint | `string` | `"outbound"` | no |
| <a name="input_dns_port"></a> [dns\_port](#input\_dns\_port) | DNS port | `number` | `53` | no |
| <a name="input_ip_addresses"></a> [ip\_addresses](#input\_ip\_addresses) | To improve reliability, Resolver requires that you specify two IP addresses for DNS queries. We recommend that you specify IP addresses in two different Availability Zones. After you add the first two IP addresses, you can optionally add more in the same or different Availability Zones. | <pre>list(<br>    object({<br>      subnet_id = string<br>      ip        = optional(string)<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A friendly name lets you easily find your endpoint on the dashboard. | `string` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | For queries that originate in your VPC, you can define how to forward DNS queries out of the VPC. | <pre>map(<br>    object({<br>      type                    = optional(string)<br>      domain_name             = string<br>      vpcs                    = optional(list(string))<br>      target_ips              = list(string)<br>      resource_share_accounts = optional(list(string), [])<br>    })<br>  )</pre> | `{}` | no |
| <a name="input_sg_ids"></a> [sg\_ids](#input\_sg\_ids) | Security group ids | `list(string)` | `[]` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | Security group name | `string` | `"sgr-route53"` | no |
| <a name="input_sg_tags"></a> [sg\_tags](#input\_sg\_tags) | Security group tags | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | All outbound DNS queries will flow through this VPC on the way from other VPCs. You can't change this value after you create an endpoint. | `string` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->