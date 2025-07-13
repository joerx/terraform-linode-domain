output "domain_id" {
  value = linode_domain.d.id
}

output "domain" {
  value = linode_domain.d.domain
}

output "ns_servers" {
  value = local.linode_ns_servers
}

output "soa_email" {
  value = linode_domain.d.soa_email
}
