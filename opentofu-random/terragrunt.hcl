terraform_binary = "tofu"

terraform {
  source = "${get_terragrunt_dir()}/module"
}

inputs = {
  name_prefix     = "tg-sample"
  password_length = 20
}
