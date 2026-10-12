locals {
  common_name = "${var.project}-${var.env}"

  common_tags = {
    Project   = var.project
    Terraform = "true"
  }
}
