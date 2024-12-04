module "unauthorised_users_modify_repository_settings_mod_platform_alarm" {
  source = "./modules/alarm"

  sns_topic_arn = module.modernisation_platform_topic.sns_topic_arn

  alarm_description = "Alarm for when any user modifies the settings of ministryofjustice/modernisation-platform repository"

  metric_name = "UnathorisedUsersModifyRepositorySettingsEventsModPlatform"
  metric_filter_pattern = {

    repositories = ["ministryofjustice/modernisation-platform-terraform-ec2-instance"]

    events = [
      "repo.access",
      "repo.change_merge_setting",
      "repo.advanced_security_disabled",
      "repo.code_scanning_analysis_deleted",
      "repo.code_scanning_autofix_disabled",
      "repo.codeql_disabled",
      "repo.set_default_workflow_permissions",
      "repo.set_workflow_permission_can_approve_pr",
      "repo.temporary_access_granted",
      "repo.update_actions_settings",
      "repo.update_default_branch",
      "repository_branch_protection_evaluation.disable",
      "repository_secret_scanning_automatic_validity_checks.disabled",
      "repository_secret_scanning.disable",
      "repository_secret_scanning_push_protection_bypass_list.disable",
      "repository_secret_scanning_push_protection_bypass_list.remove",
      "repository_secret_scanning_push_protection.disable",
      "repository_security_configuration.removed",
      "repository_visibility_change.clear",
      "repository_visibility_change.disable",
      "repository_vulnerability_alerts.disable",
      "repository_vulnerability_alerts_auto_dismissal.disable",
      "required_status_check.destroy",
      "restrict_notification_delivery.disable",
      "secret_scanning.disable",
      "vulnerability_alert_rule.disable",
      "vulnerability_alert_rule.force_disable",
      "protected_branch.authorized_users_teams",
      "protected_branch.branch_allowances",
      "protected_branch.destroy",
      "protected_branch.dismiss_stale_reviews",
      "protected_branch.dismissal_restricted_users_teams",
      "protected_branch.policy_override",
      "protected_branch.update_allow_force_pushes_enforcement_level",
      "protected_branch.update_ignore_approvals_from_contributors",
      "protected_branch.update_lock_allows_fetch_and_merge",
      "protected_branch.update_lock_branch_enforcement_level",
      "protected_branch.update_merge_queue_enforcement_level",
      "protected_branch.update_pull_request_reviews_enforcement_level",
      "protected_branch.update_require_code_owner_review",
      "protected_branch.update_require_last_push_approval",
      "protected_branch.update_required_approving_review_count",
      "protected_branch.update_required_status_checks_enforcement_level",
      "protected_branch.update_signature_requirement_enforcement_level",
      "protected_branch.update_strict_required_status_checks_policy",
      "dependabot_alerts.disable",
    ]
  }
}



