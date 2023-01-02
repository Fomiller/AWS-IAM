resource "aws_iam_policy" "hello_world_lambda_role_policy" {
  name        = "LambdaHelloWorldPolicy"
  description = "IAM Policy for LambdaHelloWorld"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Sid" : "AllowCloudwatchLogging",
      "Effect" : "Allow",
      "Action" : [
        "logs:CreateLogStream",
        "logs:CreateLogDelivery",
        "logs:PutLogEvents"
      ],
      "Resource" : "arn:aws:logs:*:*:*"
      },
      {
        "Sid" : "ListObjectsInBucket",
        "Effect" : "Allow",
        "Action" : ["s3:ListBucket"],
        "Resource" : ["arn:aws:s3:::fomiller-dev"]
      },
      {
        "Sid" : "AllObjectActions",
        "Effect" : "Allow",
        "Action" : "s3:*Object",
        "Resource" : ["arn:aws:s3:::fomiller-dev/*"]
      }
    ]
  })
}

