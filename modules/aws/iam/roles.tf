resource "aws_iam_role" "hello_world_lambda_role" {
    name               = "LambdaHelloWorld"
    assume_role_policy = data.aws_iam_policy_document.lambda_assume_policy.json
}

resource "aws_iam_role_policy_attachment" "test_policy" {
    role = aws_iam_role.test_role.name
    policy_arn = aws_iam_policy.test_policy.arn
}

resource "aws_iam_role_policy_attachment" "hello_world_policy_attachment" {
    role = aws_iam_role.hello_world_lambda_role.name
    policy_arn = aws_iam_policy.hello_world_lambda_role_policy.arn
}
