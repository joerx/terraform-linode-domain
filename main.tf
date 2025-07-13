locals {
  linode_ns_servers = [
    "ns1.linode.com",
    "ns2.linode.com",
    "ns3.linode.com",
    "ns4.linode.com",
    "ns5.linode.com",
  ]

  soa_email = var.soa_email != null ? var.soa_email : "hostmaster@${var.parent_zone}"
}

resource "linode_domain" "d" {
  type      = "master"
  domain    = "${var.zone_name}.${var.parent_zone}"
  soa_email = local.soa_email
}

# data "aws_route53_zone" "parent" {
#   name = var.parent_zone
# }

# module ""

# resource "aws_route53_record" "parent" {
#   name    = linode_domain.d.domain
#   ttl     = 300
#   type    = "NS"
#   zone_id = data.aws_route53_zone.parent.zone_id
#   records = local.linode_ns_servers
# }