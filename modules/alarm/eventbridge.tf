resource "aws_cloudwatch_event_rule" "default" {
  name        = "${aws_cloudwatch_metric_alarm.default.alarm_name}-event-rule"
  description = "EventBridge rule to capture CloudWatch alarm state changes"
  event_pattern = jsonencode({
    "source": ["aws.cloudwatch"],
    "detail-type": ["CloudWatch Alarm State Change"],
    "detail": {
      "alarmName": ["${aws_cloudwatch_metric_alarm.default.alarm_name}"],
      "state": {
        "value": ["ALARM"]
      }
    }
  })
}

resource "aws_cloudwatch_event_target" "default" {
  rule      = aws_cloudwatch_event_rule.default.name
  arn       = var.lambda_arn
  input     = jsonencode({
    alarmName     = aws_cloudwatch_metric_alarm.default.alarm_name,
    logGroupName  = var.log_group_name,
    queryString   = aws_cloudwatch_log_metric_filter.default.pattern,
    snsTopicArn   = var.sns_topic_arn,
    time          = "$.time",
    period        = var.period * 1000
  })
}