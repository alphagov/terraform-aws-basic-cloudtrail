locals {
  create_bucket = "${length("${var.bucket_name}") == 0}"

  # Name all resources in one place.
  bucket_name     = "${"${local.create_bucket}" ? "${var.resource_prefix}-bucket" : "${var.bucket_name}"}"
  cloudtrail_name = "${var.resource_prefix}-cloudtrail"
}
