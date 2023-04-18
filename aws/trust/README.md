1. Enable feature in TFC org (already done for `hashicorp-education`)

1. Create vault cluster in HCP

1. Create an admin token for your vault cluster

1. `export VAULT_TOKEN=hvs.CAESIOjcQ0fKPCcSC47XmjkkQzfQilEmvaXyWBxl-5dUnkG3GicKImh2cy53bTl4czlFQTlZVXV3cWFrUUhzbU1oa3QuUVhScTYQlwE`

1. Create a TFC user token.

1. `export TFE_TOKEN=vTzSJOuf5rNvwg.atlasv1.wB2ypgHSY3p4lgv1B7hCl8Sy0XePxe312hcu2dbbHWVQCopbyuZMUTMJYXfIa6nUThY`

1. Authenticate with AWS

1. `cp terraform.tfvars.example terraform.tfvars`

1. Edit `terraform.tfvars` to set variables.



Copy `terraform.tfvars.example` to `terraform.tfvars` and customize the required variables. You can also set values for any other variables you'd like to customize beyond the default.

Run `terraform plan` to verify your setup, and then run `terraform apply`.

Congratulations! You now have a Terraform Cloud workspace where runs will automatically authenticate to AWS when using the AWS Terraform provider.