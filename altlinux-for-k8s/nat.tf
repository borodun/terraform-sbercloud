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
  internal_service_port = 22
  external_service_port = 22
}

resource "sbercloud_nat_dnat_rule" "dnat_02" {
  floating_ip_id = sbercloud_vpc_eip.nat_eip.id
  nat_gateway_id = sbercloud_nat_gateway.nat_01.id
  private_ip = sbercloud_compute_instance.ecs_master.access_ip_v4
  protocol = "tcp"
  internal_service_port = 6443
  external_service_port = 6443
}

resource "sbercloud_nat_dnat_rule" "dnat_03" {
  floating_ip_id = sbercloud_vpc_eip.nat_eip.id
  nat_gateway_id = sbercloud_nat_gateway.nat_01.id
  private_ip = sbercloud_compute_instance.ecs_master.access_ip_v4
  protocol = "tcp"
  internal_service_port = 11251
  external_service_port = 11251
}

resource "sbercloud_nat_dnat_rule" "dnat_04" {
  floating_ip_id = sbercloud_vpc_eip.nat_eip.id
  nat_gateway_id = sbercloud_nat_gateway.nat_01.id
  private_ip = sbercloud_compute_instance.ecs_master.access_ip_v4
  protocol = "tcp"
  internal_service_port = 8000
  external_service_port = 32222
}

resource "sbercloud_nat_dnat_rule" "dnat_05" {
  floating_ip_id = sbercloud_vpc_eip.nat_eip.id
  nat_gateway_id = sbercloud_nat_gateway.nat_01.id
  private_ip = sbercloud_compute_instance.ecs_master.access_ip_v4
  protocol = "tcp"
  internal_service_port = 9999
  external_service_port = 32223
}

resource "sbercloud_nat_dnat_rule" "dnat_06" {
  floating_ip_id = sbercloud_vpc_eip.nat_eip.id
  nat_gateway_id = sbercloud_nat_gateway.nat_01.id
  private_ip = sbercloud_compute_instance.ecs_master.access_ip_v4
  protocol = "tcp"
  internal_service_port = 8080
  external_service_port = 30000
}

resource "sbercloud_nat_dnat_rule" "dnat_07" {
  floating_ip_id = sbercloud_vpc_eip.nat_eip.id
  nat_gateway_id = sbercloud_nat_gateway.nat_01.id
  private_ip = sbercloud_compute_instance.ecs_master.access_ip_v4
  protocol = "tcp"
  internal_service_port = 3000
  external_service_port = 32000
}

resource "sbercloud_nat_dnat_rule" "dnat_08" {
  floating_ip_id = sbercloud_vpc_eip.nat_eip.id
  nat_gateway_id = sbercloud_nat_gateway.nat_01.id
  private_ip = sbercloud_compute_instance.ecs_master.access_ip_v4
  protocol = "tcp"
  internal_service_port = 31112
  external_service_port = 31112
}