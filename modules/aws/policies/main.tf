# resource "aws_iam_policy" "example" {
#   name        = "super_policy"
#   path        = "/"
#   description = "My test policy"
#
#   # Terraform's "jsonencode" function converts a
#   # Terraform expression result to valid JSON syntax.
#   policy = yamldecode(data.template_file.init.rendered)
# }
#
# output "policy" {
#  value = resource.aws_iam_policy.example.policy
# }
