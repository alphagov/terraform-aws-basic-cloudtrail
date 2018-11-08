# terraform-aws-simple-cloudtrail

## Overview

This is a module to start [AWS Cloudtrail](https://aws.amazon.com/cloudtrail/) and to place the Cloudtrail logs in an S3 bucket. The bucket can be created externally and passed into the module or, if a bucket name is not passed in, a new bucket will be created.

## Getting started

Please see the [example](example).

## Inputs

| Name | Var Type | Required | Default | Description |
| :--- | :--- | :--: | :--- | :--- |
| `bucket_name` | string | **yes** | | Name of an S3 bucket that already exists. This bucket will be used to log Cloudtrail events. If no bucket name is specified then one will be created |
| `s3_key_prefix` | string | **yes** | | Specifies the S3 key prefix that precedes the name of the bucket you have designated for log file delivery |
| `resource_prefix` | string | | `bucket_name` | (Optional) Prefix used when naming the AWS Cloudtrail resource and, if not specified in the bucket_name variable, the S3 bucket used to store the Cloudtrail logs. Specifying this variable is recommended to prevent duplicate AWS resource names |
| `enable_logging` | string | | true | (Optional) Enables logging for the trail. Defaults to true. Setting this to false will pause logging |
| `predefined_acl` | string | | private | (Optional) A pre-defined or canned acl to apply to the bucket. This determines who is able to view the contents of the S3 bucket. For more information on values this field can take, see https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl |
| `custom_tags` | map | | | (Optional) List of custom tags to apply to the resource |

## Outputs

In addition to the input arguments above, with the exception of `custom_tags`, the following attributes are exported:

| Name | Var Type | Description |
| :--- | :--- | :--- |
| `id` | string | The name of the Cloudtrail resource |
| `arn` | string | The arn (Amazon Resource Name) of the Cloudtrail resource |

Any attributes not specified in the inputs will have default values assigned and these values will appear in the outputs.
