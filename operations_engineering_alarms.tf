# Alarm for when user levgorbunov1 cancels any GitHub Actions workflow

resource "aws_cloudwatch_log_metric_filter" "levgorbunov1_cancel_workflow_filter" {
  name           = "Levgorbunov1CancelWorkflowFilter"
  log_group_name = data.aws_cloudwatch_log_group.github_events_log_group.name

  pattern = "[INFO, timestamp, requestId, $.eventName = \"workflows.cancel_workflow_run\" && $.userIdentity.principalId = \"levgorbunov1\"]"

  metric_transformation {
    name      = "Levgorbunov1CancelWorkflowEvents"
    namespace = "GitHubMetrics"
    value     = "1"
  }
}

resource "aws_sns_topic" "operations_engineering_github_alerts_topic" {
  name = "operations-engineering-github-alerts"
}

resource "aws_cloudwatch_metric_alarm" "levgorbunov1_cancel_workflow_alarm" {
  alarm_name          = "Levgorbunov1CancelWorkflowAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = aws_cloudwatch_log_metric_filter.levgorbunov1_cancel_workflow_filter.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.levgorbunov1_cancel_workflow_filter.metric_transformation[0].namespace
  period              = 60
  statistic           = "Sum"
  threshold           = 0
  alarm_description   = "Alarm for when user levgorbunov1 cancels any GitHub Actions workflow"
  alarm_actions       = [aws_sns_topic.operations_engineering_github_alerts_topic.arn]
}
