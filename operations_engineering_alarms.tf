module "levgorbunov1_cancel_workflow_alarm" {
  source = "./modules/alarm"

  sns_topic_arn = module.operations_engineering_topic.sns_topic_arn

  alarm_description = "Alarm for when user levgorbunov1 cancels any GitHub Actions workflow"

  metric_name = "Levgorbunov1CancelWorkflowEvents"
  metric_filter_pattern = {
    usernames_equal_to = ["levgorbunov1"]
    events             = ["workflows.cancel_workflow_run"]
  }
}

module "unauthorised_users_modify_repository_settings_mod_platform_alarm" {
  source = "./modules/alarm"

  sns_topic_arn = module.operations_engineering_topic.sns_topic_arn

  alarm_description = "Alarm for when any user other than testuser1 modifies the settings of ministryofjustice/operations-engineering-github-cloudwatch-alarms repository"

  metric_name = "UnathorisedUsersModifyRepositorySettingsEvents"
  metric_filter_pattern = {
    usernames_not_equal_to = ["testuser1"]
    repositories           = ["ministryofjustice/operations-engineering-github-cloudwatch-alarms"]
    events                 = ["repo.access", "repo.add_member", "repo.change_merge_setting"]
  }
}
