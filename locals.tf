locals {
  create_bucket = "${length("${var.bucket_name}") == 0}"
  
  # Name all resources in one place.
  resource_prefix = "${length("${var.resource_prefix}") == 0 ? "" : "${var.resource_prefix}-"}"
  bucket_name     = "${"${local.create_bucket}" ? "${local.resource_prefix}bucket" : "${var.bucket_name}"}"
  cloudtrail_name = "${local.resource_prefix}cloudtrail"
}
