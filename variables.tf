variable "zone_name" {
  description = "Name of the zone to create, e.g. 'mydomain'."
  type        = string
}

variable "parent_zone" {
  description = "Domain name of the parent zone, e.g. 'example.com'."
  type        = string
}

variable "soa_email" {
  type        = string
  default     = null
  description = "SOA email address for the domain. If not provided, defaults to 'hostmaster@<parent_zone>'."
}
