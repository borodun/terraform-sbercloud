variable "vpcName" {
  description = "Name of VPC"
}

variable "vpcCidr" {
  description = "CIDR of VPC"
}

variable "subnetName" {
  description = "Name of subnet"
}

variable "subnetCidr" {
  description = "CIDR of subnet"
}

variable "subnetGateway" {
  description = "IP of gateway for subnet"
}

variable "primaryDNS" {
  description = "IP of 1st DNS"
}

variable "secondaryDNS" {
  description = "2nd DNS IP"
}

resource "sbercloud_vpc" "vpc_01" {
  name = "${var.prefix}-${var.vpcName}"
  cidr = var.vpcCidr
}

resource "sbercloud_vpc_subnet" "subnet_01" {
  name = "${var.prefix}-${var.subnetName}"
  cidr = var.subnetCidr
  gateway_ip = var.subnetGateway

  primary_dns = var.primaryDNS
  secondary_dns = var.secondaryDNS

  vpc_id = sbercloud_vpc.vpc_01.id
}

