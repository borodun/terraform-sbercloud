variable "natName" {
  description = "Name of NAT"
}

resource "sbercloud_vpc_eip" "nat_eip" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name = "${var.prefix}-eip-for-${var.natName}"
    size = 5
    share_type = "PER"
    charge_mode = "bandwidth"
  }
}

resource "sbercloud_nat_gateway" "nat_01" {
  name = "${var.prefix}-${var.natName}"
  description = "NAT Gateway"
  spec = "1"
  vpc_id = sbercloud_vpc.vpc_01.id
  subnet_id = sbercloud_vpc_subnet.subnet_01.id
}

resource "sbercloud_nat_snat_rule" "snat_01" {
  nat_gateway_id = sbercloud_nat_gateway.nat_01.id
  subnet_id = sbercloud_vpc_subnet.subnet_01.id
  floating_ip_id = sbercloud_vpc_eip.nat_eip.id
}

resource "sbercloud_nat_dnat_rule" "dnat_01" {
  floating_ip_id = sbercloud_vpc_eip.nat_eip.id
  nat_gateway_id = sbercloud_nat_gateway.nat_01.id
  private_ip = sbercloud_compute_instance.ecs_master.access_ip_v4
  protocol = "tcp"
  internal_service_port = local.rules.ssh-rule.port
  external_service_port = local.rules.ssh-rule.port
}

resource "sbercloud_nat_dnat_rule" "dnat_02" {
  floating_ip_id = sbercloud_vpc_eip.nat_eip.id
  nat_gateway_id = sbercloud_nat_gateway.nat_01.id
  private_ip = sbercloud_compute_instance.ecs_master.access_ip_v4
  protocol = "tcp"
  internal_service_port = local.rules.kube-api-rule.port
  external_service_port = local.rules.kube-api-rule.port
}

resource "sbercloud_nat_dnat_rule" "dnat_03" {
  floating_ip_id = sbercloud_vpc_eip.nat_eip.id
  nat_gateway_id = sbercloud_nat_gateway.nat_01.id
  private_ip = sbercloud_compute_instance.ecs_master.access_ip_v4
  protocol = "tcp"
  internal_service_port = local.rules.nodeport1-rule.port
  external_service_port = local.rules.http-rule.port
}

resource "sbercloud_nat_dnat_rule" "dnat_04" {
  floating_ip_id = sbercloud_vpc_eip.nat_eip.id
  nat_gateway_id = sbercloud_nat_gateway.nat_01.id
  private_ip = sbercloud_compute_instance.ecs_master.access_ip_v4
  protocol = "tcp"
  internal_service_port = local.rules.nodeport2-rule.port
  external_service_port = local.rules.https-rule.port
}

resource "sbercloud_nat_dnat_rule" "dnat_05" {
  floating_ip_id = sbercloud_vpc_eip.nat_eip.id
  nat_gateway_id = sbercloud_nat_gateway.nat_01.id
  private_ip = sbercloud_compute_instance.ecs_master.access_ip_v4
  protocol = "tcp"
  internal_service_port = local.rules.web1-rule.port
  external_service_port = local.rules.web1-rule.port
}

resource "sbercloud_nat_dnat_rule" "dnat_06" {
  floating_ip_id = sbercloud_vpc_eip.nat_eip.id
  nat_gateway_id = sbercloud_nat_gateway.nat_01.id
  private_ip = sbercloud_compute_instance.ecs_master.access_ip_v4
  protocol = "tcp"
  internal_service_port = local.rules.web2-rule.port
  external_service_port = local.rules.web2-rule.port
}

resource "sbercloud_nat_dnat_rule" "dnat_07" {
  floating_ip_id = sbercloud_vpc_eip.nat_eip.id
  nat_gateway_id = sbercloud_nat_gateway.nat_01.id
  private_ip = sbercloud_compute_instance.ecs_master.access_ip_v4
  protocol = "tcp"
  internal_service_port = local.rules.shell-np-rule.port
  external_service_port = local.rules.shell-np-rule.port
}
