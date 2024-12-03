module "unauthorised_users_modify_repository_settings_mod_platform_alarm" {
  source = "./modules/alarm"

  sns_topic_arn = module.modernisation_platform_topic.sns_topic_arn

  alarm_description = "Alarm for when any user modifies the settings of ministryofjustice/modernisation-platform repository"

  metric_name = "UnathorisedUsersModifyRepositorySettingsEventsModPlatform"
  metric_filter_pattern = {

    repositories = [
      "ministryofjustice/modernisation-platform",
    "ministryofjustice/modernisation-platform-terraform-ec2-instance"]

    events = [
      "repo.access",
      "repo.add_member"
      # "repo.change_merge_setting",
      # "repo.actions_enabled",
      # "repo.advanced_security_disabled",
      # "repo.advanced_security_enabled",
      # "repo.archived",
      # "repo.code_scanning_analysis_deleted",
      # "repo.code_scanning_autofix_disabled",
      # "repo.code_scanning_autofix_enabled",
      # "repo.code_scanning_autofix_third_party_tools_disabled",
      # "repo.code_scanning_autofix_third_party_tools_enabled",
      # "repo.code_scanning_configuration_for_branch_deleted",
      # "repo.codeql_disabled",
      # "repo.codeql_enabled",
      # "repo.codeql_updated",
      # "repo.codespaces_trusted_repo_access_granted",
      # "repo.codespaces_trusted_repo_access_revoked",
      # "repo.config.disable_collaborators_only",
      # "repo.config.disable_contributors_only",
      # "repo.config.disable_sockpuppet_disallowed",
      # "repo.config.enable_collaborators_only",
      # "repo.config.enable_contributors_only",
      # "repo.config.enable_sockpuppet_disallowed",
      # "repo.pages_https_redirect_disabled",
      # "repo.pages_https_redirect_enabled",
      # "repo.rename",
      # "repo.set_actions_fork_pr_approvals_policy",
      # "repo.set_actions_private_fork_pr_approvals_policy",
      # "repo.set_actions_retention_limit",
      # "repo.set_default_workflow_permissions",
      # "repo.set_fork_pr_workflows_policy",
      # "repo.set_workflow_permission_can_approve_pr",
      # "repo.staff_unlock",
      # "repo.temporary_access_granted",
      # "repo.transfer",
      # "repo.transfer_start",
      # "repo.unarchived",
      # "repo.update_actions_access_settings",
      # "repo.update_actions_settings",
      # "repo.update_default_branch",
      # "repo.update_member",
      # "repository_branch_protection_evaluation.disable",
      # "repository_branch_protection_evaluation.enable",
      # "repository_content_analysis.disable",
      # "repository_dependency_graph.disable",
      # "repository_dependency_graph.enable",
      # "repository_projects_change.clear",
      # "repository_projects_change.disable",
      # "repository_projects_change.enable",
      # "repository_ruleset.create",
      # "repository_ruleset.destroy",
      # "repository_ruleset.update",
      # "repository_secret_scanning_automatic_validity_checks.disabled",
      # "repository_secret_scanning_automatic_validity_checks.enabled",
      # "repository_secret_scanning.disable",
      # "repository_secret_scanning.enable",
      # "repository_secret_scanning_generic_secrets.disabled",
      # "repository_secret_scanning_generic_secrets.enabled",
      # "repository_secret_scanning_non_provider_patterns.disabled",
      # "repository_secret_scanning_non_provider_patterns.enabled",
      # "repository_secret_scanning_push_protection_bypass_list.add",
      # "repository_secret_scanning_push_protection_bypass_list.disable",
      # "repository_secret_scanning_push_protection_bypass_list.enable",
      # "repository_secret_scanning_push_protection_bypass_list.remove",
      # "repository_secret_scanning_push_protection.disable",
      # "repository_secret_scanning_push_protection.enable",
      # "repository_security_configuration.removed",
      # "repository_security_configuration.removed_by_settings_change",
      # "repository_visibility_change.clear",
      # "repository_visibility_change.disable",
      # "repository_visibility_change.enable",
      # "repository_vulnerability_alerts.disable",
      # "repository_vulnerability_alerts_auto_dismissal.disable",
      # "repository_vulnerability_alerts_auto_dismissal.enable",
      # "required_status_check.create",
      # "required_status_check.destroy",
      # "restrict_notification_delivery.disable",
      # "restrict_notification_delivery.enable",
      # "secret_scanning.disable",
      # "secret_scanning.enable",
      # "ssh_certificate_authority.destroy",
      # "ssh_certificate_requirement.disable",
      # "ssh_certificate_requirement.enable",
      # "vulnerability_alert_rule.disable",
      # "vulnerability_alert_rule.force_disable",
      # "protected_branch.authorized_users_teams",
      # "protected_branch.branch_allowances",
      # "protected_branch.create",
      # "protected_branch.destroy",
      # "protected_branch.dismiss_stale_reviews",
      # "protected_branch.dismissal_restricted_users_teams",
      # "protected_branch.policy_override",
      # "protected_branch.rejected_ref_update",
      # "protected_branch.update_admin_enforced",
      # "protected_branch.update_allow_force_pushes_enforcement_level",
      # "protected_branch.update_ignore_approvals_from_contributors",
      # "protected_branch.update_lock_allows_fetch_and_merge",
      # "protected_branch.update_lock_branch_enforcement_level",
      # "protected_branch.update_merge_queue_enforcement_level",
      # "protected_branch.update_name",
      # "protected_branch.update_pull_request_reviews_enforcement_level",
      # "protected_branch.update_require_code_owner_review",
      # "protected_branch.update_require_last_push_approval",
      # "protected_branch.update_required_approving_review_count",
      # "protected_branch.update_required_status_checks_enforcement_level",
      # "protected_branch.update_signature_requirement_enforcement_level",
      # "protected_branch.update_strict_required_status_checks_policy",
      # "private_repository_forking.clear",
      # "private_repository_forking.disable",
      # "private_repository_forking.enable",
      # "dependabot_alerts.disable",
      # "dependabot_alerts.enable"
    ]
  }
}

