terraform_binary = "terraform"

terraform {
  source = "${get_terragrunt_dir()}/module"
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "${local.aws_region}"

  default_tags {
    tags = {
      ManagedBy = "Terragrunt"
      Project   = "terragrunt-samples"
    }
  }
}
EOF
}

locals {
  aws_region = "eu-central-1"
}

inputs = {
  bucket_prefix = "terragrunt-samples"
  environment   = "dev"
}
