resource "aws_cloudwatch_event_rule" "default" {
  name        = "alarm-state-change-rule"
  description = "EventBridge rule to capture CloudWatch alarm state changes"
  event_pattern = jsonencode({
    "source": ["aws.cloudwatch"],
    "detail-type": ["CloudWatch Alarm State Change"],
    "detail": {
      "state": {
        "value": ["ALARM"]
      }
    }
  })
}

resource "aws_cloudwatch_event_target" "default" {
  rule      = aws_cloudwatch_event_rule.default.name
  arn       = var.sfn_arn
  input     = <<EOF
    {
      "alarmName": "<$.detail.alarmName>",
      "logGroupName": "${data.aws_cloudwatch_log_group.github_events_log_group.name}",
      "queryString": "${aws_cloudwatch_log_metric_filter.default.pattern}",
      "snsTopicArn": "${module.operations_engineering_topic.sns_topic_arn}",
      "startTime": "<$.time - ${var.period}>",
      "endTime": "<$.time>"
    }
  EOF
}