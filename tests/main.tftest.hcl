mock_provider "linode" {}

variables {
  parent_zone = "example.com"
  zone_name   = "main"
}

run "sets_correct_name_and_email" {
  assert {
    condition     = linode_domain.d.domain == "${var.zone_name}.${var.parent_zone}"
    error_message = "incorrect zone name"
  }

  assert {
    condition     = linode_domain.d.soa_email == "hostmaster@${var.parent_zone}"
    error_message = "incorrect SOA email"
  }
}

run "returns_correct_nameservers" {
  assert {
    condition = output.ns_servers == [
      "ns1.linode.com",
      "ns2.linode.com",
      "ns3.linode.com",
      "ns4.linode.com",
      "ns5.linode.com",
    ]
    error_message = "incorrect nameservers"
  }
}
