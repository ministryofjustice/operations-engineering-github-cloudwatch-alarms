############################################
# modernisation-platform repo alarm events #
############################################

# Branch Protection Rule Modifications
module "unauthorized_users_modify_repository_settings_branch_protection_modernisation_platform" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for branch protection rule modifications in the repository"
  metric_name       = "BranchProtectionRuleModificationEventsmodernisation-platform"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform"]

    events = [
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
      "protected_branch.update_signature_requirement_enforcement_level"
    ]
  }
}

# Repository Settings Changes
module "unauthorized_users_modify_repository_settings_repo_changes_modernisation_platform" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for repository settings changes in the repository"
  metric_name       = "RepositorySettingsChangeEventsmodernisation-platform"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform"]

    events = [
      "repo.add_member",
      "repo.change_merge_setting",
      "repo.remove_member",
      "repo.rename",
      "repo.transfer",
      "repo.transfer_start",
      "repo.update_default_branch"
    ]
  }
}

# Visibility and Access Control
module "unauthorized_users_modify_repository_settings_visibility_modernisation_platform" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for visibility and access control changes in the repository"
  metric_name       = "VisibilityAccessControlChangeEventsmodernisation-platform"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform"]

    events = [
      "repository_visibility_change.disable",
      "repository_visibility_change.enable",
      "private_repository_forking.enable"
    ]
  }
}

# Security Scanning and Vulnerabilities
module "unauthorized_users_modify_repository_settings_security_modernisation_platform" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for security scanning and vulnerabilities changes in the repository"
  metric_name       = "SecurityScanningVulnerabilitiesChangeEventsmodernisation-platform"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform"]

    events = [
      "repository_security_configuration.removed",
      "repository_vulnerability_alerts.disable",
      "repository_vulnerability_alerts.enable",
      "repository_secret_scanning.disable",
      "repository_secret_scanning_push_protection.disable",
      "dependabot_alerts.disable",
      "dependabot_alerts.enable",
      "secret_scanning.disable",
      "secret_scanning.enable"
    ]
  }
}

# Administrative Privileges
module "unauthorized_users_modify_repository_settings_admin_privileges_modernisation_platform" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for administrative privilege changes in the repository"
  metric_name       = "AdminPrivilegesChangeEventsmodernisation-platform"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform"]

    events = [
      "business.add_admin",
      "business.remove_admin",
      "business.audit_log_export",
      "business.enable_two_factor_requirement",
      "business.disable_two_factor_requirement"
    ]
  }
}

# Audit Log Modifications
module "unauthorized_users_modify_repository_settings_audit_log_modernisation_platform" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for audit log modifications in the repository"
  metric_name       = "AuditLogModificationEventsmodernisation-platform"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform"]

    events = [
      "audit_log_streaming.create",
      "audit_log_streaming.destroy"
    ]
  }
}

###################################################################
# modernisation-platform-terraform-ec2-instance repo alarm events #
###################################################################


# Branch Protection Rule Modifications
module "unauthorized_users_modify_repository_settings_branch_protection_modernisation_platform_terraform_ec2_instance" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for branch protection rule modifications in the repository"
  metric_name       = "BranchProtectionRuleModificationEvents-modernisation-platform-terraform-ec2-instance"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-terraform-ec2-instance"]

    events = [
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
      "protected_branch.update_signature_requirement_enforcement_level"
    ]
  }
}

# Repository Settings Changes
module "unauthorized_users_modify_repository_settings_repo_changes_modernisation_platform_terraform_ec2_instance" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for repository settings changes in the repository"
  metric_name       = "RepositorySettingsChangeEvents-modernisation-platform-terraform-ec2-instance"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-terraform-ec2-instance"]

    events = [
      "repo.add_member",
      "repo.change_merge_setting",
      "repo.remove_member",
      "repo.rename",
      "repo.transfer",
      "repo.transfer_start",
      "repo.update_default_branch"
    ]
  }
}

# Visibility and Access Control
module "unauthorized_users_modify_repository_settings_visibility_modernisation_platform_terraform_ec2_instance" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for visibility and access control changes in the repository"
  metric_name       = "VisibilityAccessControlChangeEvents-modernisation-platform-terraform-ec2-instance"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-terraform-ec2-instance"]

    events = [
      "repository_visibility_change.disable",
      "repository_visibility_change.enable",
      "private_repository_forking.enable"
    ]
  }
}

# Security Scanning and Vulnerabilities
module "unauthorized_users_modify_repository_settings_security_modernisation_platform_terraform_ec2_instance" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for security scanning and vulnerabilities changes in the repository"
  metric_name       = "SecurityScanningVulnerabilitiesChangeEvents-modernisation-platform-terraform-ec2-instance"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-terraform-ec2-instance"]

    events = [
      "repository_security_configuration.removed",
      "repository_vulnerability_alerts.disable",
      "repository_vulnerability_alerts.enable",
      "repository_secret_scanning.disable",
      "repository_secret_scanning_push_protection.disable",
      "dependabot_alerts.disable",
      "dependabot_alerts.enable",
      "secret_scanning.disable",
      "secret_scanning.enable"
    ]
  }
}

# Administrative Privileges
module "unauthorized_users_modify_repository_settings_admin_privileges_modernisation_platform_terraform_ec2_instance" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for administrative privilege changes in the repository"
  metric_name       = "AdminPrivilegesChangeEvents-modernisation-platform-terraform-ec2-instance"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-terraform-ec2-instance"]

    events = [
      "business.add_admin",
      "business.remove_admin",
      "business.audit_log_export",
      "business.enable_two_factor_requirement",
      "business.disable_two_factor_requirement"
    ]
  }
}

# Audit Log Modifications
module "unauthorized_users_modify_repository_settings_audit_log_modernisation_platform_terraform_ec2_instance" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for audit log modifications in the repository"
  metric_name       = "AuditLogModificationEvents-modernisation-platform-terraform-ec2-instance"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-terraform-ec2-instance"]

    events = [
      "audit_log_streaming.create",
      "audit_log_streaming.destroy"
    ]
  }
}

#########################################################
# modernisation-platform-environments repo alarm events #
#########################################################

# Branch Protection Rule Modifications
module "unauthorized_users_modify_repository_settings_branch_protection_modernisation_platform_environments" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for branch protection rule modifications in the repository"
  metric_name       = "BranchProtectionRuleModificationEvents-modernisation-platform-environments"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-environments"]

    events = [
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
      "protected_branch.update_signature_requirement_enforcement_level"
    ]
  }
}

# Repository Settings Changes
module "unauthorized_users_modify_repository_settings_repo_changes_modernisation_platform_environments" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for repository settings changes in the repository"
  metric_name       = "RepositorySettingsChangeEvents-modernisation-platform-environments"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-environments"]

    events = [
      "repo.add_member",
      "repo.change_merge_setting",
      "repo.remove_member",
      "repo.rename",
      "repo.transfer",
      "repo.transfer_start",
      "repo.update_default_branch"
    ]
  }
}

# Visibility and Access Control
module "unauthorized_users_modify_repository_settings_visibility_modernisation_platform_environments" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for visibility and access control changes in the repository"
  metric_name       = "VisibilityAccessControlChangeEvents-modernisation-platform-environments"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-environments"]

    events = [
      "repository_visibility_change.disable",
      "repository_visibility_change.enable",
      "private_repository_forking.enable"
    ]
  }
}

# Security Scanning and Vulnerabilities
module "unauthorized_users_modify_repository_settings_security_modernisation_platform_environments" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for security scanning and vulnerabilities changes in the repository"
  metric_name       = "SecurityScanningVulnerabilitiesChangeEvents-modernisation-platform-environments"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-environments"]

    events = [
      "repository_security_configuration.removed",
      "repository_vulnerability_alerts.disable",
      "repository_vulnerability_alerts.enable",
      "repository_secret_scanning.disable",
      "repository_secret_scanning_push_protection.disable",
      "dependabot_alerts.disable",
      "dependabot_alerts.enable",
      "secret_scanning.disable",
      "secret_scanning.enable"
    ]
  }
}

# Administrative Privileges
module "unauthorized_users_modify_repository_settings_admin_privileges_modernisation_platform_environments" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for administrative privilege changes in the repository"
  metric_name       = "AdminPrivilegesChangeEvents-modernisation-platform-environments"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-environments"]

    events = [
      "business.add_admin",
      "business.remove_admin",
      "business.audit_log_export",
      "business.enable_two_factor_requirement",
      "business.disable_two_factor_requirement"
    ]
  }
}

# Audit Log Modifications
module "unauthorized_users_modify_repository_settings_audit_log_modernisation_platform_environments" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for audit log modifications in the repository"
  metric_name       = "AuditLogModificationEvents-modernisation-platform-environments"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-environments"]

    events = [
      "audit_log_streaming.create",
      "audit_log_streaming.destroy"
    ]
  }
}

#######################################################
# modernisation-platform-ami-builds repo alarm events #
#######################################################

# Branch Protection Rule Modifications
module "unauthorized_users_modify_repository_settings_branch_protection_modernisation_platform_ami_builds" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for branch protection rule modifications in the repository"
  metric_name       = "BranchProtectionRuleModificationEvents-modernisation-platform-ami-builds"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
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
      "protected_branch.update_signature_requirement_enforcement_level"
    ]
  }
}

# Repository Settings Changes
module "unauthorized_users_modify_repository_settings_repo_changes_modernisation_platform_ami_builds" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for repository settings changes in the repository"
  metric_name       = "RepositorySettingsChangeEvents-modernisation-platform-ami-builds"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "repo.add_member",
      "repo.change_merge_setting",
      "repo.remove_member",
      "repo.rename",
      "repo.transfer",
      "repo.transfer_start",
      "repo.update_default_branch"
    ]
  }
}

# Visibility and Access Control
module "unauthorized_users_modify_repository_settings_visibility_modernisation_platform_ami_builds" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for visibility and access control changes in the repository"
  metric_name       = "VisibilityAccessControlChangeEvents-modernisation-platform-ami-builds"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "repository_visibility_change.disable",
      "repository_visibility_change.enable",
      "private_repository_forking.enable"
    ]
  }
}

# Security Scanning and Vulnerabilities
module "unauthorized_users_modify_repository_settings_security_modernisation_platform_ami_builds" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for security scanning and vulnerabilities changes in the repository"
  metric_name       = "SecurityScanningVulnerabilitiesChangeEvents-modernisation-platform-ami-builds"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "repository_security_configuration.removed",
      "repository_vulnerability_alerts.disable",
      "repository_vulnerability_alerts.enable",
      "repository_secret_scanning.disable",
      "repository_secret_scanning_push_protection.disable",
      "dependabot_alerts.disable",
      "dependabot_alerts.enable",
      "secret_scanning.disable",
      "secret_scanning.enable"
    ]
  }
}

# Administrative Privileges
module "unauthorized_users_modify_repository_settings_admin_privileges_modernisation_platform_ami_builds" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for administrative privilege changes in the repository"
  metric_name       = "AdminPrivilegesChangeEvents-modernisation-platform-ami-builds"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "business.add_admin",
      "business.remove_admin",
      "business.audit_log_export",
      "business.enable_two_factor_requirement",
      "business.disable_two_factor_requirement"
    ]
  }
}

# Audit Log Modifications
module "unauthorized_users_modify_repository_settings_audit_log_modernisation_platform_ami_builds" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for audit log modifications in the repository"
  metric_name       = "AuditLogModificationEvents-modernisation-platform-ami-builds"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "audit_log_streaming.create",
      "audit_log_streaming.destroy"
    ]
  }
}

#####################################################################
# modernisation-platform-configuration-management repo alarm events #
#####################################################################


# Branch Protection Rule Modifications
module "unauthorized_users_modify_repository_settings_branch_protection_modernisation_platform_configuration_management" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for branch protection rule modifications in the repository"
  metric_name       = "BranchProtectionRuleModificationEvents-modernisation-platform-configuration-management"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
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
      "protected_branch.update_signature_requirement_enforcement_level"
    ]
  }
}

# Repository Settings Changes
module "unauthorized_users_modify_repository_settings_repo_changes_modernisation_platform_configuration_management" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for repository settings changes in the repository"
  metric_name       = "RepositorySettingsChangeEvents-modernisation-platform-configuration-management"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "repo.add_member",
      "repo.change_merge_setting",
      "repo.remove_member",
      "repo.rename",
      "repo.transfer",
      "repo.transfer_start",
      "repo.update_default_branch"
    ]
  }
}

# Visibility and Access Control
module "unauthorized_users_modify_repository_settings_visibility_modernisation_platform_configuration_management" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for visibility and access control changes in the repository"
  metric_name       = "VisibilityAccessControlChangeEvents-modernisation-platform-configuration-management"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "repository_visibility_change.disable",
      "repository_visibility_change.enable",
      "private_repository_forking.enable"
    ]
  }
}

# Security Scanning and Vulnerabilities
module "unauthorized_users_modify_repository_settings_security_modernisation_platform_configuration_management" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for security scanning and vulnerabilities changes in the repository"
  metric_name       = "SecurityScanningVulnerabilitiesChangeEvents-modernisation-platform-configuration-management"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "repository_security_configuration.removed",
      "repository_vulnerability_alerts.disable",
      "repository_vulnerability_alerts.enable",
      "repository_secret_scanning.disable",
      "repository_secret_scanning_push_protection.disable",
      "dependabot_alerts.disable",
      "dependabot_alerts.enable",
      "secret_scanning.disable",
      "secret_scanning.enable"
    ]
  }
}

# Administrative Privileges
module "unauthorized_users_modify_repository_settings_admin_privileges_modernisation_platform_configuration_management" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for administrative privilege changes in the repository"
  metric_name       = "AdminPrivilegesChangeEvents-modernisation-platform-configuration-management"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "business.add_admin",
      "business.remove_admin",
      "business.audit_log_export",
      "business.enable_two_factor_requirement",
      "business.disable_two_factor_requirement"
    ]
  }
}

# Audit Log Modifications
module "unauthorized_users_modify_repository_settings_audit_log_modernisation_platform_configuration_management" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for audit log modifications in the repository"
  metric_name       = "AuditLogModificationEvents-modernisation-platform-configuration-management"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "audit_log_streaming.create",
      "audit_log_streaming.destroy"
    ]
  }
}

#####################################################################
# modernisation-platform-terraform-module-template repo alarm events #
#####################################################################


# Branch Protection Rule Modifications
module "unauthorized_users_modify_repository_settings_branch_protection_modernisation_platform_terraform_module_template" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for branch protection rule modifications in the repository"
  metric_name       = "BranchProtectionRuleModificationEvents-modernisation-platform-terraform-module-template"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
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
      "protected_branch.update_signature_requirement_enforcement_level"
    ]
  }
}

# Repository Settings Changes
module "unauthorized_users_modify_repository_settings_repo_changes_modernisation_platform_terraform_module_template" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for repository settings changes in the repository"
  metric_name       = "RepositorySettingsChangeEvents-modernisation-platform-terraform-module-template"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "repo.add_member",
      "repo.change_merge_setting",
      "repo.remove_member",
      "repo.rename",
      "repo.transfer",
      "repo.transfer_start",
      "repo.update_default_branch"
    ]
  }
}

# Visibility and Access Control
module "unauthorized_users_modify_repository_settings_visibility_modernisation_platform_terraform_module_template" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for visibility and access control changes in the repository"
  metric_name       = "VisibilityAccessControlChangeEvents-modernisation-platform-terraform-module-template"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "repository_visibility_change.disable",
      "repository_visibility_change.enable",
      "private_repository_forking.enable"
    ]
  }
}

# Security Scanning and Vulnerabilities
module "unauthorized_users_modify_repository_settings_security_modernisation_platform_terraform_module_template" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for security scanning and vulnerabilities changes in the repository"
  metric_name       = "SecurityScanningVulnerabilitiesChangeEvents-modernisation-platform-terraform-module-template"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "repository_security_configuration.removed",
      "repository_vulnerability_alerts.disable",
      "repository_vulnerability_alerts.enable",
      "repository_secret_scanning.disable",
      "repository_secret_scanning_push_protection.disable",
      "dependabot_alerts.disable",
      "dependabot_alerts.enable",
      "secret_scanning.disable",
      "secret_scanning.enable"
    ]
  }
}

# Administrative Privileges
module "unauthorized_users_modify_repository_settings_admin_privileges_modernisation_platform_terraform_module_template" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for administrative privilege changes in the repository"
  metric_name       = "AdminPrivilegesChangeEvents-modernisation-platform-terraform-module-template"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "business.add_admin",
      "business.remove_admin",
      "business.audit_log_export",
      "business.enable_two_factor_requirement",
      "business.disable_two_factor_requirement"
    ]
  }
}

# Audit Log Modifications
module "unauthorized_users_modify_repository_settings_audit_log_modernisation_platform_terraform_module_template" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for audit log modifications in the repository"
  metric_name       = "AuditLogModificationEvents-modernisation-platform-terraform-module-template"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "audit_log_streaming.create",
      "audit_log_streaming.destroy"
    ]
  }
}

####################################################################
# modernisation-platform-terraform-bastion-linux repo alarm events #
####################################################################


# Branch Protection Rule Modifications
module "unauthorized_users_modify_repository_settings_branch_protection_modernisation_platform_terraform_bastion_linux" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for branch protection rule modifications in the repository"
  metric_name       = "BranchProtectionRuleModificationEvents-modernisation-platform-terraform-bastion-linux"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
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
      "protected_branch.update_signature_requirement_enforcement_level"
    ]
  }
}

# Repository Settings Changes
module "unauthorized_users_modify_repository_settings_repo_changes_modernisation_platform_terraform_bastion_linux" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for repository settings changes in the repository"
  metric_name       = "RepositorySettingsChangeEvents-modernisation-platform-terraform-bastion-linux"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "repo.add_member",
      "repo.change_merge_setting",
      "repo.remove_member",
      "repo.rename",
      "repo.transfer",
      "repo.transfer_start",
      "repo.update_default_branch"
    ]
  }
}

# Visibility and Access Control
module "unauthorized_users_modify_repository_settings_visibility_modernisation_platform_terraform_bastion_linux" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for visibility and access control changes in the repository"
  metric_name       = "VisibilityAccessControlChangeEvents-modernisation-platform-terraform-bastion-linux"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "repository_visibility_change.disable",
      "repository_visibility_change.enable",
      "private_repository_forking.enable"
    ]
  }
}

# Security Scanning and Vulnerabilities
module "unauthorized_users_modify_repository_settings_security_modernisation_platform_terraform_bastion_linux" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for security scanning and vulnerabilities changes in the repository"
  metric_name       = "SecurityScanningVulnerabilitiesChangeEvents-modernisation-platform-terraform-bastion-linux"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "repository_security_configuration.removed",
      "repository_vulnerability_alerts.disable",
      "repository_vulnerability_alerts.enable",
      "repository_secret_scanning.disable",
      "repository_secret_scanning_push_protection.disable",
      "dependabot_alerts.disable",
      "dependabot_alerts.enable",
      "secret_scanning.disable",
      "secret_scanning.enable"
    ]
  }
}

# Administrative Privileges
module "unauthorized_users_modify_repository_settings_admin_privileges_modernisation_platform_terraform_bastion_linux" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for administrative privilege changes in the repository"
  metric_name       = "AdminPrivilegesChangeEvents-modernisation-platform-terraform-bastion-linux"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "business.add_admin",
      "business.remove_admin",
      "business.audit_log_export",
      "business.enable_two_factor_requirement",
      "business.disable_two_factor_requirement"
    ]
  }
}

# Audit Log Modifications
module "unauthorized_users_modify_repository_settings_audit_log_modernisation_platform_terraform_bastion_linux" {
  source = "./modules/alarm"

  sns_topic_arn     = module.modernisation_platform_topic.sns_topic_arn
  alarm_description = "Alarm for audit log modifications in the repository"
  metric_name       = "AuditLogModificationEvents-modernisation-platform-terraform-bastion-linux"
  metric_filter_pattern = {
    repositories = ["ministryofjustice/modernisation-platform-ami-builds"]

    events = [
      "audit_log_streaming.create",
      "audit_log_streaming.destroy"
    ]
  }
}

