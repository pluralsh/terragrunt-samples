variable "name_prefix" {
  type    = string
  default = "demo"
}

variable "password_length" {
  type    = number
  default = 16

  validation {
    condition     = var.password_length >= 8
    error_message = "password_length must be at least 8."
  }
}
