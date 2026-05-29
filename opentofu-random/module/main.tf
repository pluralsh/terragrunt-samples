terraform {
  required_version = ">= 1.6.0"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

resource "random_pet" "name" {
  prefix    = var.name_prefix
  separator = "-"
  length    = 2
}

resource "random_password" "secret" {
  length  = var.password_length
  special = true
}
