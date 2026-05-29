terraform_binary = "tofu"

terraform {
  source = "${get_terragrunt_dir()}/module"
}

inputs = {
  greeting   = "Hello from Terragrunt + OpenTofu!"
  team_name  = "platform"
  output_dir = "${get_terragrunt_dir()}/output"
}
