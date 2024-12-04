# variables.tf
variable "unauthorised_event_patterns" {
  description = "List of unauthorised event patterns to monitor"
  type        = list(string)
  default = [
    "repo.access",
    "repo.add_member",
    "repo.change_merge_setting",
    "repo.actions_enabled",
    "repo.advanced_security_disabled",
    "repo.advanced_security_enabled",
    "repo.archived",
    "repo.code_scanning_analysis_deleted",
    "repo.code_scanning_autofix_disabled",
    "repo.update_actions_settings",
    "repo.update_default_branch",
    "repo.rename",
    "repository_branch_protection_evaluation.disable",
    "repository_ruleset.create",
    # Add more events here...
  ]
}

variable "group_size" {
  description = "Number of events in each group to stay within AWS limits"
  type        = number
  default     = 20
}

# locals.tf
locals {
  # Split the events into groups to ensure each group is within AWS's limit
  event_groups = chunklist(var.unauthorised_event_patterns, var.group_size)

  # Define metric names for each group dynamically
  metric_names = [
    for index in range(length(local.event_groups)) :
    "UnauthorisedRepoSettingsGroup${index + 1}"
  ]
}

# Module for each group of events
module "unauthorised_users_modify_repository_settings_alarms" {
  source            = "./modules/alarm"
  count             = length(local.event_groups)
  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for unauthorised repository settings modification - Group ${count.index + 1}"
  metric_name       = local.metric_names[count.index]
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-github-oidc-provider"]
    events       = local.event_groups[count.index]
  }
}

# Create a CloudWatch alarm for each metric group
resource "aws_cloudwatch_metric_alarm" "unauthorised_users_modify_repository_settings" {
  count = length(local.event_groups)

  alarm_name          = "UnauthorisedRepoSettingsGroup${count.index + 1}"
  alarm_description   = "Alarm for unauthorised repository settings modification - Group ${count.index + 1}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = local.metric_names[count.index]
  namespace           = "CustomMetrics"
  period              = 300
  statistic           = "Sum"
  threshold           = 1
  alarm_actions       = [module.modernisation_platform_topic.sns_topic_arn]
}
