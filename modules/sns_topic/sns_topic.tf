resource "aws_sns_topic" "default" {
  name = "${var.team}-github-alerts"
}

resource "aws_sns_topic_subscription" "default" {
  for_each = toset(var.subscribers)

  topic_arn = aws_sns_topic.default.arn
  protocol  = "email"
  endpoint  = each.value
}