variable "workerNodesCount" {
  description = "Worker nodes count"
  sensitive = true
}

variable "discSize" {
  description = "Disc size"
}

variable "workerFlavour" {
  description = "Worker node type"
}

variable "masterFlavour" {
  description = "Master node type"
}

variable "keyPair" {
  description = "Name of the key pair"
}

data "sbercloud_images_image" "alt_image" {
  name = "Alt Server V 9.2"
  most_recent = true
}

resource "sbercloud_compute_instance" "ecs_01" {
  count = var.workerNodesCount

  name = "${var.prefix}-ecs-worker-${count.index}"
  image_id = data.sbercloud_images_image.alt_image.id
  flavor_id = var.workerFlavour
  security_groups = [sbercloud_networking_secgroup.sg_01.name]
  availability_zone = "ru-moscow-1a"
  key_pair = var.keyPair

  user_data = file("./script.sh")

  system_disk_type = "SAS"
  system_disk_size = var.discSize


  network {
    uuid = sbercloud_vpc_subnet.subnet_01.id
  }
}

resource "sbercloud_compute_instance" "ecs_master" {
  name = "${var.prefix}-ecs-master"
  image_id = data.sbercloud_images_image.alt_image.id
  flavor_id = var.masterFlavour
  security_groups = [sbercloud_networking_secgroup.sg_01.name]
  availability_zone = "ru-moscow-1a"
  key_pair = var.keyPair

  user_data = file("./script.sh")

  system_disk_type = "SAS"
  system_disk_size = var.discSize


  network {
    uuid = sbercloud_vpc_subnet.subnet_01.id
  }
}