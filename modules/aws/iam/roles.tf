resource "aws_iam_role" "hello_world_lambda_role" {
  name               = "LambdaHelloWorld"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_policy.json
}

resource "aws_iam_role_policy_attachment" "hello_world_policy_attachment" {
  role       = aws_iam_role.hello_world_lambda_role.name
  policy_arn = aws_iam_policy.hello_world_lambda_role_policy.arn
}

resource "aws_iam_role" "aws_terraform" {
  name               = "AWSTERRAFORM"
  assume_role_policy = data.aws_iam_policy_document.aws_terraform_assume_policy.json
}

resource "aws_iam_role_policy_attachment" "aws_terraform" {
  role       = aws_iam_role.aws_terraform.name
  policy_arn = data.aws_iam_policy.admin_access.arn
}

resource "aws_iam_role" "eventbridge_ecs_role" {
  name               = "CsEventBridgeEcsRole"
  assume_role_policy = data.aws_iam_policy_document.eventbridge_assume_policy.json
}

# resource "aws_iam_role_policy_attachment" "ecs_events" {
#   role       = aws_iam_role.aws_terraform.name
#   policy_arn = data.aws_iam_policy.admin_access.arn
# }
