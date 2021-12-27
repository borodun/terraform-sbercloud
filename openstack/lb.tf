variable "elbName" {
  description = "Name of ELB"
}

variable "listenerName" {
  description = "Name of Listener"
}

resource "sbercloud_lb_loadbalancer" "elb_01" {
  name = "${var.prefix}-${var.elbName}"
  vip_subnet_id = sbercloud_vpc_subnet.subnet_01.subnet_id
}

resource "sbercloud_lb_listener" "listener_01" {
  name = "${var.prefix}-${var.listenerName}"
  protocol = "TCP"
  protocol_port = 80
  loadbalancer_id = sbercloud_lb_loadbalancer.elb_01.id
}
