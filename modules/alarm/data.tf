data "aws_lambda_function" "alarm_handler_lambda" {
  function_name = "cloudwatch_alarm_handler"
}