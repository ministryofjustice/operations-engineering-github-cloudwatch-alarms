module "unauthorised_users_modify_repository_settings_mod_platform_alarm" {
  source = "./modules/alarm"

  sns_topic_arn = module.modernisation_platform_topic.sns_topic_arn

  alarm_description = "Alarm for when any user modifies the settings of ministryofjustice/modernisation-platform repository"

  metric_name = "UnathorisedUsersModifyRepositorySettingsEventsModPlatform"
  metric_filter_pattern = {

    repositories = ["ministryofjustice/modernisation-platform-terraform-ec2-instance"]

    events = ["protected_branch.update_signature_requirement_enforcement_level"
    ]
  }
}