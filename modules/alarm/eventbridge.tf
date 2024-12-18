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
  rule = aws_cloudwatch_event_rule.default.name
  arn  = var.lambda_arn

  input_transformer {
    input_paths = {
      alarmName    = "$.detail.alarmName"
      time         = "$.time"
      logGroupName = "${var.log_group_name}"
      queryString = "${aws_cloudwatch_log_metric_filter.default.pattern}"
      snsTopicArn = "${var.sns_topic_arn}"
      period = var.period * 1000
    }

    input_template = <<EOF
{
  "alarmName": <alarmName>,
  "logGroupName": <logGroupName>,
  "queryString": <queryString>,
  "snsTopicArn": <snsTopicArn>,
  "time": <time>,
  "period": <period>
}
EOF
  }
}
