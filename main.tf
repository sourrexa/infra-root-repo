module "vpc" {
  source                  = "git::https://github.com/sourrexa/terraform-gcp-modules.git//vpc?ref=v1.0.0"
  name                    = "my-vpc"
  auto_create_subnetworks = false
}

module "bucket" {
  source   = "git::https://github.com/sourrexa/terraform-gcp-modules.git//bucket?ref=v1.0.0//bucket?ref=v1.0.0"
  name     = "my-demo-bucket"
  location = "us-central1"
}

module "compute" {
  source       = "git::https://github.com/sourrexa/terraform-gcp-modules.git//compute?ref=v1.0.0"
  name         = "vm-1"
  machine_type = "e2-medium"
  zone         = "us-central1-a"
  image        = "debian-cloud/debian-12"
  network      = module.vpc.network_self_link
}
