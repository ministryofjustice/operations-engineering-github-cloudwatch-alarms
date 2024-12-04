module "unauthorised_users_modify_repository_settings_mod_platform_alarm" {
  source = "./modules/alarm"

  sns_topic_arn = module.modernisation_platform_topic.sns_topic_arn

  alarm_description = "Alarm for when any user modifies the settings of ministryofjustice/modernisation-platform repository"

  metric_name = "UnauthorisedUsersModifyRepositorySettingsEventsModPlatform"
  metric_filter_pattern = {

    repositories = ["ministryofjustice/modernisation-platform-terraform-ec2-instance"]

    events = [
      # Branch Protection Rule Modifications
      "protected_branch.create",
      "protected_branch.destroy",
      "protected_branch.update_admin_enforced",
      "protected_branch.update_signature_requirement_enforcement_level",
      "protected_branch.update_required_status_checks_enforcement_level",
      "protected_branch.update_pull_request_reviews_enforcement_level",
      "protected_branch.update_require_code_owner_review",
      "protected_branch.update_required_approving_review_count",

      # Repository Visibility and Access Changes
      "repository_visibility_change.enable",
      "repository_visibility_change.disable",
      "repo.add_member",
      "repo.remove_member",

      # Security Feature Toggles
      "repository_vulnerability_alerts.enable",
      "repository_vulnerability_alerts.disable",
      "secret_scanning.enable",
      "secret_scanning.disable",
      "dependabot_alerts.enable",
      "dependabot_alerts.disable",

      # Administrative Privilege Changes
      "business.add_admin",
      "business.remove_admin",
      "business.enable_two_factor_requirement",
      "business.disable_two_factor_requirement",

      # Audit Log Access and Modifications
      "business.audit_log_export",
      "audit_log_streaming.create",
      "audit_log_streaming.destroy"
    ]
  }
}
