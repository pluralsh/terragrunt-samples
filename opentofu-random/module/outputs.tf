output "generated_name" {
  value = random_pet.name.id
}

output "generated_password" {
  value     = random_password.secret.result
  sensitive = true
}
