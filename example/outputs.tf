output "bucket_name" {
  value = "${module.cloudwatch_example.bucket_name}"
}

output "s3_key_prefix" {
  value = "${module.cloudwatch_example.s3_key_prefix}"
}

output "resource_prefix" {
  value = "${module.cloudwatch_example.resource_prefix}"
}

output "enable_logging" {
  value = "${module.cloudwatch_example.enable_logging}"
}

output "predefined_acl" {
  value = "${module.cloudwatch_example.predefined_acl}"
}

output "id" {
  value = "${module.cloudwatch_example.id}"
}

output "arn" {
  value = "${module.cloudwatch_example.arn}"
}
