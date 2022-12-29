variable "username" {
  description = "The username for the DB master user"
  type        = string
}

resource "aws_secretsmanager_secret" "example" {
  name = "example"
}

resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = aws_secretsmanager_secret.example.id
  secret_string = var.username
}
