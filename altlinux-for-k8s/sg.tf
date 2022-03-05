variable "sgName" {
  description = "Security group name"
}

locals {
  rules = {
    http-rule = {
      description = "Allow HTTP from anywhere",
      protocol    = "tcp",
      port        = 80,
      source      = "0.0.0.0/0"
    },
    https-rule = {
      description = "Allow HTTPS from anywhere",
      protocol    = "tcp",
      port        = 443,
      source      = "0.0.0.0/0"
    },
    ssh-rule = {
      description = "Allow SSH from anywhere",
      protocol    = "tcp",
      port        = 22,
      source      = "0.0.0.0/0"
    },
    kube-api-rule = {
      description = "Allow kube-api",
      protocol    = "tcp",
      port        = 6443,
      source      = "0.0.0.0/0"
    },
    kublr-agent-rule = {
      description = "Allow kublr agent",
      protocol    = "tcp",
      port        = 11251,
      source      = "0.0.0.0/0"
    },
    k0sapi-rule = {
      description = "Allow k0sAPI",
      protocol    = "tcp",
      port        = 9443,
      source      = "0.0.0.0/0"
    },
    konnectivity-admin-rule = {
      description = "Allow konnectivity admin",
      protocol    = "tcp",
      port        = 8133,
      source      = "0.0.0.0/0"
    },
    konnectivity-agent-rule = {
      description = "Allow konnectivity agent",
      protocol    = "tcp",
      port        = 8132,
      source      = "0.0.0.0/0"
    },
    etcd-rule = {
      description = "etcd peers",
      protocol    = "tcp",
      port        = 2380,
      source      = "0.0.0.0/0"
    },
    kube-router-rule = {
      description = "kube-router",
      protocol    = "tcp",
      port        = 179,
      source      = "0.0.0.0/0"
    },
    calico-rule = {
      description = "calico",
      protocol    = "udp",
      port        = 4789,
      source      = "0.0.0.0/0"
    },
    kubelet-rule = {
      description = "kubelet",
      protocol    = "tcp",
      port        = 10250,
      source      = "0.0.0.0/0"
    }
  }
}

resource "sbercloud_networking_secgroup" "sg_01" {
  name        = "${var.prefix}-${var.sgName}"
  description = "Security group for k8s on altlinux"
}

resource "sbercloud_networking_secgroup_rule" "sg_rule_01" {
  for_each = local.rules

  direction        = "ingress"
  ethertype        = "IPv4"
  description      = each.value.description
  protocol         = each.value.protocol
  port_range_min   = each.value.port
  port_range_max   = each.value.port
  remote_ip_prefix = each.value.source

  security_group_id = sbercloud_networking_secgroup.sg_01.id
}