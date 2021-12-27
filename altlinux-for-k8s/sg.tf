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
    kube-api-rule = {
      description = "Allow kube-api",
      protocol = "tcp",
      port = 6443,
      source = "0.0.0.0/0"
    },
    kublr-agent-rule = {
      description = "Allow kublr agent",
      protocol = "tcp",
      port = 11251,
      source = "0.0.0.0/0"
    }
  }
}

resource "sbercloud_networking_secgroup" "sg_01" {
  name = "${var.prefix}-${var.sgName}"
  description = "Security group for k8s on altlinux"
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