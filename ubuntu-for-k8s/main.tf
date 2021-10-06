terraform {
  required_providers {
    sbercloud = {
      source = "sbercloud-terraform/sbercloud"
    }
  }
}

provider "sbercloud" {
  // use SBC_ACCESS_KEY, SBC_SECRET_KEY, SBC_PROJECT_NAME, SBC_REGION_NAME env vars
}