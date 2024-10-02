module "levgorbunov1_cancel_workflow_alarm" {
  source = "./modules/alarm"

  sns_topic_arn         = module.operations_engineering_topic.sns_topic_arn
  metric_name           = "Levgorbunov1CancelWorkflowEvents"
  metric_filter_pattern = "{ ($.eventName = \"workflows.cancel_workflow_run\") && ($.userIdentity.principalId = levgorbunov1) }"
  alarm_description     = "Alarm for when user levgorbunov1 cancels any GitHub Actions workflow"
}

module "unauthorised_users_modify_repository_settings_alarm" {
  source = "./modules/alarm"

  sns_topic_arn         = module.operations_engineering_topic.sns_topic_arn
  metric_name           = "UnathorisedUsersModifyRepositorySettingsEvents"
  metric_filter_pattern = <<EOF
{
  ($.eventName = "repo.access") || ($.eventName = "repo.add_member") || ($.eventName = "repo.change_merge_setting")
  && 
  ($.userIdentity.principalId != "testuser1") 
  &&
  ($.userIdentity.details.Repository= "ministryofjustice/operations-engineering-github-cloudwatch-alarms") 
}
EOF
  alarm_description     = "Alarm for when user levgorbunov1 cancels any GitHub Actions workflow"
}