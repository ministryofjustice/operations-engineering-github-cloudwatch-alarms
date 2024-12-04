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
      "protected_branch.policy_override",
      "protected_branch.update_admin_enforced",
      "protected_branch.update_allow_force_pushes_enforcement_level",
      "protected_branch.update_ignore_approvals_from_contributors",
      "protected_branch.update_lock_allows_fetch_and_merge",
      "protected_branch.update_pull_request_reviews_enforcement_level",
      "protected_branch.update_require_code_owner_review",
      "protected_branch.update_required_approving_review_count",
      "protected_branch.update_required_status_checks_enforcement_level",
      "protected_branch.update_signature_requirement_enforcement_level",

      # Repository Settings Changes
      "repo.add_member",
      "repo.change_merge_setting",
      "repo.remove_member",
      "repo.rename",
      "repo.staff_unlock",
      "repo.transfer",
      "repo.transfer_start",
      "repo.update_default_branch",

      # Visibility and Access Control
      "repository_visibility_change.disable",
      "repository_visibility_change.enable",
      "private_repository_forking.enable",

      # Security Scanning and Vulnerabilities
      "repository_security_configuration.removed",
      "repository_vulnerability_alerts.disable",
      "repository_vulnerability_alerts.enable",
      "repository_vulnerability_alerts_auto_dismissal.disable",
      "repository_secret_scanning.disable",
      "repository_secret_scanning_push_protection.disable",
      "dependabot_alerts.disable",
      "dependabot_alerts.enable",
      "secret_scanning.disable",
      "secret_scanning.enable",

      # Administrative Privileges
      "business.add_admin",
      "business.remove_admin",
      "business.audit_log_export",
      "business.enable_two_factor_requirement",
      "business.disable_two_factor_requirement",

      # Audit Log Modifications
      "audit_log_streaming.create",
      "audit_log_streaming.destroy"
    ]
  }
}
