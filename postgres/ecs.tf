variable "discSize" {
  description = "Disc size"
}

variable "flavour" {
  description = "Worker node type"
}

variable "keyPair" {
  description = "Name of the key pair"
}

variable "image" {
  description = "Name of the image"
}

data "sbercloud_images_image" "ecs_image" {
  name = var.image
  most_recent = true
}

resource "sbercloud_compute_instance" "postgres" {
  name = "${var.prefix}-ecs"
  image_id = data.sbercloud_images_image.ecs_image.id
  flavor_id = var.flavour
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
