resource "aws_sns_topic" "sns_topic" {
  name = "${var.team}-github-alerts"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  for_each = toset(var.subscribers)

  topic_arn = aws_sns_topic.sns_topic.arn
  protocol  = "email"
  endpoint  = each.value
}