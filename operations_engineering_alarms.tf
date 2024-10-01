# Alarm for when user levgorbunov1 cancels any GitHub Actions workflow

resource "aws_cloudwatch_log_metric_filter" "levgorbunov1_cancel_workflow_filter" {
  name           = "Levgorbunov1CancelWorkflowFilter"
  log_group_name = data.aws_cloudwatch_log_group.github_events_log_group.name

  pattern = "[INFO, timestamp, requestId, { $.eventName = \"workflows.cancel_workflow_run\" && $.userIdentity.principalId = \"levgorbunov1\" }]"

  metric_transformation {
    name      = "Levgorbunov1CancelWorkflowEvents"
    namespace = "GitHubMetrics"
    value     = "1"
  }
}