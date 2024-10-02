resource "aws_cloudwatch_log_metric_filter" "levgorbunov1_cancel_workflow_filter" {
  name           = var.metric_name
  log_group_name = data.aws_cloudwatch_log_group.github_events_log_group.name

  pattern = <<EOF
  {
    ${length(var.metric_filter_pattern.usernames_equal_to) != null ? "(${join(" || ", formatlist("$.userIdentity.principalId = \"%s\"", var.metric_filter_pattern.usernames_equal_to))}) &&" : ""}
    ${length(var.metric_filter_pattern.usernames_not_equal_to) != null ? "(${join(" || ", formatlist("$.userIdentity.principalId = \"%s\"", var.metric_filter_pattern.usernames_not_equal_to))}) &&" : ""}
    ${length(var.metric_filter_pattern.events) != null ? "(${join(" || ", formatlist("$.eventName = \"%s\"", var.metric_filter_pattern.events))}) &&" : ""}
    ${length(var.metric_filter_pattern.repositories) != null ? "(${join(" || ", formatlist("$.userIdentity.details.Repository = \"%s\"", var.metric_filter_pattern.repositories))}) &&" : ""}
    ${length(var.metric_filter_pattern.organisations) != null ? "(${join(" || ", formatlist("$.userIdentity.details.GitHubOrganization = \"%s\"", var.metric_filter_pattern.organisations))})" : ""}
  }
  EOF

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
