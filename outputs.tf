output "bucket_name" {
  description = "Name of the bucket that contains the Cloudtrail logs"
  value       = "${data.aws_s3_bucket.cloudtrail_bucket.id}"
}

output "s3_key_prefix" {
  description = "Prefix of the S3 bucket key used to hold the Cloudtrail logs"
  value       = "${var.s3_key_prefix}"
}

output "resource_prefix" {
  description = "Prefix used when naming the AWS Cloudtrail resource and, if not specified in the bucket_name variable, the S3 bucket used to store the Cloudtrail logs. Specifying this variable is recommended to prevent duplicate AWS resource names"
  value       = "${local.resource_prefix}"
}

output "enable_logging" {
  description = "Whether or not to enable logging for the trail. Defaults to true. Setting this to false will pause logging"
  value       = "${var.enable_logging}"
}

output "predefined_acl" {
  description = "A pre-defined or canned acl to apply to the bucket. This determines who is able to view the contents of the S3 bucket. For more information on values this field can take, see https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl"
  value       = "${var.predefined_acl}"
}

output "id" {
  description = "The name of the Cloudtrail resource"
  value       = "${aws_cloudtrail.cloudtrail.id}"
}

output "arn" {
  description = "The arn (Amazon Resource Name) of the Cloudtrail resource"
  value       = "${aws_cloudtrail.cloudtrail.arn}"
}
