resource "aws_cloudwatch_log_metric_filter" "levgorbunov1_cancel_workflow_filter" {
  name           = var.metric_name
  log_group_name = data.aws_cloudwatch_log_group.github_events_log_group.name

  pattern = var.metric_filter_pattern

  metric_transformation {
    name      = var.metric_name
    namespace = "GitHubMetrics"
    value     = "1"
  }
}

resource "aws_cloudwatch_metric_alarm" "levgorbunov1_cancel_workflow_alarm" {
  alarm_name        = "${var.metric_name}Alarm"
  alarm_description = var.alarm_description

  metric_name = aws_cloudwatch_log_metric_filter.levgorbunov1_cancel_workflow_filter.metric_transformation[0].name
  namespace   = aws_cloudwatch_log_metric_filter.levgorbunov1_cancel_workflow_filter.metric_transformation[0].namespace

  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  period              = var.period
  statistic           = "Sum"
  threshold           = var.threshold

  alarm_actions = [var.sns_topic_arn]
}
