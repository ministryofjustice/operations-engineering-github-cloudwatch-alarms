data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "lambdas"
  output_path = "extract_cloudwatch_event.zip"
}

resource "aws_lambda_function" "alarm_handler_lambda" {
  function_name = "cloudwatch_alarm_handler"
  runtime       = "python3.11"
  handler       = "extract_cloudwatch_event.lambda_handler"

  role     = aws_iam_role.lambda_role.arn
  filename = data.archive_file.lambda_zip.output_path

  environment {
    variables = {
      LOG_GROUP_NAME = "/aws/lambda/GitHubIngestFunction"
    }
  }
}

resource "aws_iam_role" "alarm_handler_lambda_role" {
  name = "alarm_handler_lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
        Effect = "Allow",
        Sid    = ""
      }
    ]
  })
}

resource "aws_iam_policy" "alarm_handler_lambda_policy" {
  name        = "lambda-cloudwatch-sns-policy"
  description = "Policy for Lambda to access CloudWatch Logs and SNS"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "logs:StartQuery",
          "logs:GetQueryResults",
          "logs:FilterLogEvents"
        ],
        Resource = "*",
        Effect   = "Allow"
      },
      {
        Action   = "sns:Publish",
        Resource = "*",
        Effect   = "Allow"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "alarm_handler_lambda_policy_attachment" {
  role       = aws_iam_role.alarm_handler_lambda_role.name
  policy_arn = aws_iam_policy.alarm_handler_lambda_policy.arn
}
