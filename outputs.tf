output "appautoscaling_policies_id" {
  description = "Map of id values across all appautoscaling_policies, keyed the same as var.appautoscaling_policies"
  value       = { for k, v in aws_appautoscaling_policy.appautoscaling_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "appautoscaling_policies_alarm_arns" {
  description = "Map of alarm_arns values across all appautoscaling_policies, keyed the same as var.appautoscaling_policies"
  value       = { for k, v in aws_appautoscaling_policy.appautoscaling_policies : k => v.alarm_arns if v.alarm_arns != null && length(v.alarm_arns) > 0 }
}
output "appautoscaling_policies_arn" {
  description = "Map of arn values across all appautoscaling_policies, keyed the same as var.appautoscaling_policies"
  value       = { for k, v in aws_appautoscaling_policy.appautoscaling_policies : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "appautoscaling_policies_name" {
  description = "Map of name values across all appautoscaling_policies, keyed the same as var.appautoscaling_policies"
  value       = { for k, v in aws_appautoscaling_policy.appautoscaling_policies : k => v.name if v.name != null && length(v.name) > 0 }
}
output "appautoscaling_policies_policy_type" {
  description = "Map of policy_type values across all appautoscaling_policies, keyed the same as var.appautoscaling_policies"
  value       = { for k, v in aws_appautoscaling_policy.appautoscaling_policies : k => v.policy_type if v.policy_type != null && length(v.policy_type) > 0 }
}
output "appautoscaling_policies_predictive_scaling_policy_configuration" {
  description = "Map of predictive_scaling_policy_configuration values across all appautoscaling_policies, keyed the same as var.appautoscaling_policies"
  value       = { for k, v in aws_appautoscaling_policy.appautoscaling_policies : k => one(v.predictive_scaling_policy_configuration) if v.predictive_scaling_policy_configuration != null && length(v.predictive_scaling_policy_configuration) > 0 }
}
output "appautoscaling_policies_region" {
  description = "Map of region values across all appautoscaling_policies, keyed the same as var.appautoscaling_policies"
  value       = { for k, v in aws_appautoscaling_policy.appautoscaling_policies : k => v.region if v.region != null && length(v.region) > 0 }
}
output "appautoscaling_policies_resource_id" {
  description = "Map of resource_id values across all appautoscaling_policies, keyed the same as var.appautoscaling_policies"
  value       = { for k, v in aws_appautoscaling_policy.appautoscaling_policies : k => v.resource_id if v.resource_id != null && length(v.resource_id) > 0 }
}
output "appautoscaling_policies_scalable_dimension" {
  description = "Map of scalable_dimension values across all appautoscaling_policies, keyed the same as var.appautoscaling_policies"
  value       = { for k, v in aws_appautoscaling_policy.appautoscaling_policies : k => v.scalable_dimension if v.scalable_dimension != null && length(v.scalable_dimension) > 0 }
}
output "appautoscaling_policies_service_namespace" {
  description = "Map of service_namespace values across all appautoscaling_policies, keyed the same as var.appautoscaling_policies"
  value       = { for k, v in aws_appautoscaling_policy.appautoscaling_policies : k => v.service_namespace if v.service_namespace != null && length(v.service_namespace) > 0 }
}
output "appautoscaling_policies_step_scaling_policy_configuration" {
  description = "Map of step_scaling_policy_configuration values across all appautoscaling_policies, keyed the same as var.appautoscaling_policies"
  value       = { for k, v in aws_appautoscaling_policy.appautoscaling_policies : k => one(v.step_scaling_policy_configuration) if v.step_scaling_policy_configuration != null && length(v.step_scaling_policy_configuration) > 0 }
}
output "appautoscaling_policies_target_tracking_scaling_policy_configuration" {
  description = "Map of target_tracking_scaling_policy_configuration values across all appautoscaling_policies, keyed the same as var.appautoscaling_policies"
  value       = { for k, v in aws_appautoscaling_policy.appautoscaling_policies : k => one(v.target_tracking_scaling_policy_configuration) if v.target_tracking_scaling_policy_configuration != null && length(v.target_tracking_scaling_policy_configuration) > 0 }
}

