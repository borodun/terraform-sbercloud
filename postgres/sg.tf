variable "sgName" {
  description = "Security group name"
}

locals {
  rules = {
    http-rule = {
      description = "Allow HTTP from anywhere",
      protocol = "tcp",
      port = 80,
      source = "0.0.0.0/0"
    },
    https-rule = {
      description = "Allow HTTPS from anywhere",
      protocol = "tcp",
      port = 443,
      source = "0.0.0.0/0"
    },
    ssh-rule = {
      description = "Allow SSH from anywhere",
      protocol = "tcp",
      port = 22,
      source = "0.0.0.0/0"
    },
    kublrbox-rule = {
      description = "Allow default postgress port",
      protocol = "tcp",
      port = 5432,
      source = "0.0.0.0/0"
    }
  }
}

resource "sbercloud_networking_secgroup" "sg_01" {
  name = "${var.prefix}-${var.sgName}"
  description = "Security group with SSH, HTTP, HTTPS, Prometheus, Grafana, OpenFaaS"
}

resource "sbercloud_networking_secgroup_rule" "sg_rule_01" {
  for_each = local.rules

  direction = "ingress"
  ethertype = "IPv4"
  description = each.value.description
  protocol = each.value.protocol
  port_range_min = each.value.port
  port_range_max = each.value.port
  remote_ip_prefix = each.value.source

  security_group_id = sbercloud_networking_secgroup.sg_01.id
}