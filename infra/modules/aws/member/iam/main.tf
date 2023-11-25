locals {
  terraform_user = "AWSTerrafrom${upper(var.environment)}"
  terraform_role = "AWSTERRAFORM"
}
