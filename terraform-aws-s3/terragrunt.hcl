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

# Set a globally unique bucket name before first apply.
remote_state {
  backend = "s3"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }

  config = {
    bucket         = "terragrunt-samples-tfstate-change-me"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.aws_region
    encrypt        = true
    dynamodb_table = "terragrunt-samples-tf-locks"
  }
}

locals {
  aws_region = "eu-central-1"
}

inputs = {
  bucket_prefix = "terragrunt-samples"
  environment   = "dev"
}
