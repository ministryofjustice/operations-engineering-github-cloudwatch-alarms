module "levgorbunov1_cancel_workflow_alarm" {
  source = "./modules/alarm"

  metric_name = "Levgorbunov1CancelWorkflowEvents"
  metric_filter_pattern = "{ ($.eventName = \"workflows.cancel_workflow_run\") && ($.userIdentity.principalId = levgorbunov1) }"

  alarm_name = "Levgorbunov1CancelWorkflowAlarm"
  alarm_description = "Alarm for when user levgorbunov1 cancels any GitHub Actions workflow"

  team = "operations-engineering"
  
  subscribers = ["lev.gorbunov@digital.justice.gov.uk"]
}