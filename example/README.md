# Example configuration

This working example that demonstrates how you can use this module to set up Cloudtrail logging in an S3 bucket.  By working through the example it will result in you having Cloudtrail logs being stored inside either a new S3 bucket or an S3 bucket you've already created.

To work through this example you will need to clone this repo.

## Prerequisites

Before you start you'll need:

* a basic understanding of how to use [Terraform](https://www.terraform.io/)

* an AWS user account with administrator access

* [Terraform v0.11.7](https://releases.hashicorp.com/terraform/0.11.7/) installed on your computer

* [AWS Command Line Interface (CLI)](https://aws.amazon.com/cli/) installed on your computer

## How to run the example

1. Add your AWS user credentials to `~/.aws/credentials`. If this file does not exist, you'll need to create it.

	```
	[my-aws-profile]
	aws_access_key_id = [your aws key here]
	aws_secret_access_key = [your aws secret here]
	```

1. Set AWS environment variables

	**Note:** If you're using bash, add a space at the start of `export AWS_ACCESS_KEY_ID` and `export AWS_SECRET_ACCESS_KEY` to prevent them from being added to `~/.bash_history`.

	```
	export AWS_ACCESS_KEY_ID="[aws key]"
	export AWS_SECRET_ACCESS_KEY="[aws secret]"
	export AWS_DEFAULT_REGION="eu-west-1"
	```


1. Clone the terraform-aws-basic-cloudtrail repo

	```
	git clone https://github.com/alphagov/terraform-aws-basic-cloudtrail.git
	```

1. Go to the `examples` directory

1. Rename the `terraform.tfvars.example` file to `terraform.tfvars`.

1. Edit the `terraform.tfvars` file to reflect the following configuration:

	| Name | Var Type | Required | Default | Description |
	| :--- | :--- | :--: | :--- | :--- |
	| `aws_profile` | string | | default aws profile in ~/.aws/credentials | AWS Profile (credentials) to use |
	| `aws_region` | string | | default aws region | AWS Region to use, eg. eu-west-1 |
	| `environment` | string | **yes** | none | Environment name (e.g. production, test, ci). This is used to construct the S3 key name into which the Cloudtrail output is saved |
	| `product` | string | **yes** | none | Name of the product whose infrastructure is being monitered. This is used to construct the S3 key name into which the Cloudtrail output is saved |
	| `bucket_name` | string | | | Name of an S3 bucket that already exists. This bucket will be used to log Cloudtrail events. If no bucket name is specified then one will be assigned randomly |
	| `resource_prefix` | string | | cloudtrail | Prefix used when naming the AWS Cloudtrail resource and, if not specified in the bucket_name variable, the S3 bucket used to store the Cloudtrail logs. Specifying this variable is recommended to prevent duplicate AWS resource names |
	| `s3_key_prefix` | string | | **yes** | Specifies the S3 key prefix that precedes the name of the bucket you have designated for log file delivery |

1. Initialise Terraform

	```
	terraform init
	```

1. Plan and Apply Terraform

	```
	terraform plan -var-file=./terraform.tfvars -out terraform.plan
	```

	```
	terraform apply terraform.plan
	```

You should now see the name of the bucket created (if you didn't pass in the name of a bucket you'd already created) and the prefix of the files instead the bucket used to store the Cloudtrail logs.

The logs created can either be inspected via the AWS console or downloaded via the AWS cli.
