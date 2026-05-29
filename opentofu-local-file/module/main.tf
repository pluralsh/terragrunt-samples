terraform {
  required_version = ">= 1.6.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

resource "local_file" "greeting" {
  filename = "${var.output_dir}/${var.team_name}-greeting.txt"
  content  = <<EOT
${var.greeting}

Generated for team: ${var.team_name}
EOT
}
