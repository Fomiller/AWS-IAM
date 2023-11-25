locals {
  terraform_user = "AWSTerraform${upper(var.environment)}"
  terraform_role = "AWSTERRAFORM"
}
