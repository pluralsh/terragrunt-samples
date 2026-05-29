# Terragrunt Samples

Small [Terragrunt](https://terragrunt.gruntwork.io/) examples using **Terraform** and **OpenTofu**.

```
<project>/
├── terragrunt.hcl
└── module/
```

| Project                                        | Engine    | Description                                      |
| ---------------------------------------------- | --------- | ------------------------------------------------ |
| [`terraform-aws-s3`](./terraform-aws-s3)       | Terraform | Private S3 bucket (random name, optional prefix) |
| [`opentofu-local-file`](./opentofu-local-file) | OpenTofu  | Writes a text file via `local` provider          |
| [`opentofu-random`](./opentofu-random)         | OpenTofu  | Random name + password via `random` provider     |

OpenTofu projects set `terraform_binary = "tofu"`. The AWS sample sets `terraform_binary = "terraform"` as Terragrunt 1.0 defaults to OpenTofu.

## Install

```bash
brew install terragrunt terraform opentofu
```

AWS sample also needs `aws configure`.

## Usage

```bash
cd opentofu-random
terragrunt apply
terragrunt destroy
```

For `terraform-aws-s3`, set a unique `remote_state.config.bucket` before the first run.
