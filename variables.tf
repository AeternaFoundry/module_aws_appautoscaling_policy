variable "appautoscaling_policies" {
  description = <<EOT
Map of appautoscaling_policies, attributes below
Required:
    - name
    - resource_id
    - scalable_dimension
    - service_namespace
Optional:
    - policy_type
    - region
    - predictive_scaling_policy_configuration (block):
        - max_capacity_breach_behavior (optional)
        - max_capacity_buffer (optional)
        - metric_specification (required, block):
            - customized_capacity_metric_specification (optional, block):
                - metric_data_query (required, block):
                    - expression (optional)
                    - id (required)
                    - label (optional)
                    - metric_stat (optional, block):
                        - metric (required, block):
                            - dimension (optional, block):
                                - name (required)
                                - value (required)
                            - metric_name (optional)
                            - namespace (optional)
                        - stat (required)
                        - unit (optional)
                    - return_data (optional)
            - customized_load_metric_specification (optional, block):
                - metric_data_query (required, block):
                    - expression (optional)
                    - id (required)
                    - label (optional)
                    - metric_stat (optional, block):
                        - metric (required, block):
                            - dimension (optional, block):
                                - name (required)
                                - value (required)
                            - metric_name (optional)
                            - namespace (optional)
                        - stat (required)
                        - unit (optional)
                    - return_data (optional)
            - customized_scaling_metric_specification (optional, block):
                - metric_data_query (required, block):
                    - expression (optional)
                    - id (required)
                    - label (optional)
                    - metric_stat (optional, block):
                        - metric (required, block):
                            - dimension (optional, block):
                                - name (required)
                                - value (required)
                            - metric_name (optional)
                            - namespace (optional)
                        - stat (required)
                        - unit (optional)
                    - return_data (optional)
            - predefined_load_metric_specification (optional, block):
                - predefined_metric_type (required)
                - resource_label (optional)
            - predefined_metric_pair_specification (optional, block):
                - predefined_metric_type (required)
                - resource_label (optional)
            - predefined_scaling_metric_specification (optional, block):
                - predefined_metric_type (required)
                - resource_label (optional)
            - target_value (required)
        - mode (optional)
        - scheduling_buffer_time (optional)
    - step_scaling_policy_configuration (block):
        - adjustment_type (optional)
        - cooldown (optional)
        - metric_aggregation_type (optional)
        - min_adjustment_magnitude (optional)
        - step_adjustment (optional, block):
            - metric_interval_lower_bound (optional)
            - metric_interval_upper_bound (optional)
            - scaling_adjustment (required)
    - target_tracking_scaling_policy_configuration (block):
        - customized_metric_specification (optional, block):
            - dimensions (optional, block):
                - name (required)
                - value (required)
            - metric_name (optional)
            - metrics (optional, block):
                - expression (optional)
                - id (required)
                - label (optional)
                - metric_stat (optional, block):
                    - metric (required, block):
                        - dimensions (optional, block):
                            - name (required)
                            - value (required)
                        - metric_name (required)
                        - namespace (required)
                    - stat (required)
                    - unit (optional)
                - return_data (optional)
            - namespace (optional)
            - statistic (optional)
            - unit (optional)
        - disable_scale_in (optional)
        - predefined_metric_specification (optional, block):
            - predefined_metric_type (required)
            - resource_label (optional)
        - scale_in_cooldown (optional)
        - scale_out_cooldown (optional)
        - target_value (required)
EOT

  type = map(object({
    name               = string
    resource_id        = string
    scalable_dimension = string
    service_namespace  = string
    policy_type        = optional(string)
    region             = optional(string)
    predictive_scaling_policy_configuration = optional(object({
      max_capacity_breach_behavior = optional(string)
      max_capacity_buffer          = optional(number)
      metric_specification = list(object({
        customized_capacity_metric_specification = optional(object({
          metric_data_query = list(object({
            expression = optional(string)
            id         = string
            label      = optional(string)
            metric_stat = optional(object({
              metric = object({
                dimension = optional(list(object({
                  name  = string
                  value = string
                })))
                metric_name = optional(string)
                namespace   = optional(string)
              })
              stat = string
              unit = optional(string)
            }))
            return_data = optional(bool)
          }))
        }))
        customized_load_metric_specification = optional(object({
          metric_data_query = list(object({
            expression = optional(string)
            id         = string
            label      = optional(string)
            metric_stat = optional(object({
              metric = object({
                dimension = optional(list(object({
                  name  = string
                  value = string
                })))
                metric_name = optional(string)
                namespace   = optional(string)
              })
              stat = string
              unit = optional(string)
            }))
            return_data = optional(bool)
          }))
        }))
        customized_scaling_metric_specification = optional(object({
          metric_data_query = list(object({
            expression = optional(string)
            id         = string
            label      = optional(string)
            metric_stat = optional(object({
              metric = object({
                dimension = optional(list(object({
                  name  = string
                  value = string
                })))
                metric_name = optional(string)
                namespace   = optional(string)
              })
              stat = string
              unit = optional(string)
            }))
            return_data = optional(bool)
          }))
        }))
        predefined_load_metric_specification = optional(object({
          predefined_metric_type = string
          resource_label         = optional(string)
        }))
        predefined_metric_pair_specification = optional(object({
          predefined_metric_type = string
          resource_label         = optional(string)
        }))
        predefined_scaling_metric_specification = optional(object({
          predefined_metric_type = string
          resource_label         = optional(string)
        }))
        target_value = string
      }))
      mode                   = optional(string)
      scheduling_buffer_time = optional(number)
    }))
    step_scaling_policy_configuration = optional(object({
      adjustment_type          = optional(string)
      cooldown                 = optional(number)
      metric_aggregation_type  = optional(string)
      min_adjustment_magnitude = optional(number)
      step_adjustment = optional(list(object({
        metric_interval_lower_bound = optional(string)
        metric_interval_upper_bound = optional(string)
        scaling_adjustment          = number
      })))
    }))
    target_tracking_scaling_policy_configuration = optional(object({
      customized_metric_specification = optional(object({
        dimensions = optional(list(object({
          name  = string
          value = string
        })))
        metric_name = optional(string)
        metrics = optional(list(object({
          expression = optional(string)
          id         = string
          label      = optional(string)
          metric_stat = optional(object({
            metric = object({
              dimensions = optional(list(object({
                name  = string
                value = string
              })))
              metric_name = string
              namespace   = string
            })
            stat = string
            unit = optional(string)
          }))
          return_data = optional(bool)
        })))
        namespace = optional(string)
        statistic = optional(string)
        unit      = optional(string)
      }))
      disable_scale_in = optional(bool)
      predefined_metric_specification = optional(object({
        predefined_metric_type = string
        resource_label         = optional(string)
      }))
      scale_in_cooldown  = optional(number)
      scale_out_cooldown = optional(number)
      target_value       = number
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.appautoscaling_policies : (
        v.predictive_scaling_policy_configuration == null || (length(v.predictive_scaling_policy_configuration.metric_specification) >= 1)
      )
    ])
    error_message = "Each metric_specification list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.appautoscaling_policies : (
        v.predictive_scaling_policy_configuration == null || (alltrue([for item in v.predictive_scaling_policy_configuration.metric_specification : (item.customized_capacity_metric_specification == null || (length(item.customized_capacity_metric_specification.metric_data_query) >= 1))]))
      )
    ])
    error_message = "Each metric_data_query list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.appautoscaling_policies : (
        v.predictive_scaling_policy_configuration == null || (alltrue([for item in v.predictive_scaling_policy_configuration.metric_specification : (item.customized_load_metric_specification == null || (length(item.customized_load_metric_specification.metric_data_query) >= 1))]))
      )
    ])
    error_message = "Each metric_data_query list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.appautoscaling_policies : (
        v.predictive_scaling_policy_configuration == null || (alltrue([for item in v.predictive_scaling_policy_configuration.metric_specification : (item.customized_scaling_metric_specification == null || (length(item.customized_scaling_metric_specification.metric_data_query) >= 1))]))
      )
    ])
    error_message = "Each metric_data_query list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.appautoscaling_policies : (
        v.predictive_scaling_policy_configuration == null || (v.predictive_scaling_policy_configuration.max_capacity_buffer == null || (v.predictive_scaling_policy_configuration.max_capacity_buffer >= 0 && v.predictive_scaling_policy_configuration.max_capacity_buffer <= 100))
      )
    ])
    error_message = "must be between 0 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.appautoscaling_policies : (
        v.predictive_scaling_policy_configuration == null || (alltrue([for item in v.predictive_scaling_policy_configuration.metric_specification : (item.predefined_load_metric_specification == null || (length(item.predefined_load_metric_specification.predefined_metric_type) >= 1 && length(item.predefined_load_metric_specification.predefined_metric_type) <= 128))]))
      )
    ])
    error_message = "must be between 1 and 128 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appautoscaling_policies : (
        v.predictive_scaling_policy_configuration == null || (alltrue([for item in v.predictive_scaling_policy_configuration.metric_specification : (item.predefined_load_metric_specification == null || (item.predefined_load_metric_specification.resource_label == null || (length(item.predefined_load_metric_specification.resource_label) >= 1 && length(item.predefined_load_metric_specification.resource_label) <= 1023)))]))
      )
    ])
    error_message = "must be between 1 and 1023 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appautoscaling_policies : (
        v.predictive_scaling_policy_configuration == null || (alltrue([for item in v.predictive_scaling_policy_configuration.metric_specification : (item.predefined_metric_pair_specification == null || (length(item.predefined_metric_pair_specification.predefined_metric_type) >= 1 && length(item.predefined_metric_pair_specification.predefined_metric_type) <= 128))]))
      )
    ])
    error_message = "must be between 1 and 128 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appautoscaling_policies : (
        v.predictive_scaling_policy_configuration == null || (alltrue([for item in v.predictive_scaling_policy_configuration.metric_specification : (item.predefined_metric_pair_specification == null || (item.predefined_metric_pair_specification.resource_label == null || (length(item.predefined_metric_pair_specification.resource_label) >= 1 && length(item.predefined_metric_pair_specification.resource_label) <= 1023)))]))
      )
    ])
    error_message = "must be between 1 and 1023 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appautoscaling_policies : (
        v.predictive_scaling_policy_configuration == null || (alltrue([for item in v.predictive_scaling_policy_configuration.metric_specification : (item.predefined_scaling_metric_specification == null || (length(item.predefined_scaling_metric_specification.predefined_metric_type) >= 1 && length(item.predefined_scaling_metric_specification.predefined_metric_type) <= 128))]))
      )
    ])
    error_message = "must be between 1 and 128 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appautoscaling_policies : (
        v.predictive_scaling_policy_configuration == null || (alltrue([for item in v.predictive_scaling_policy_configuration.metric_specification : (item.predefined_scaling_metric_specification == null || (item.predefined_scaling_metric_specification.resource_label == null || (length(item.predefined_scaling_metric_specification.resource_label) >= 1 && length(item.predefined_scaling_metric_specification.resource_label) <= 1023)))]))
      )
    ])
    error_message = "must be between 1 and 1023 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appautoscaling_policies : (
        v.predictive_scaling_policy_configuration == null || (v.predictive_scaling_policy_configuration.scheduling_buffer_time == null || (v.predictive_scaling_policy_configuration.scheduling_buffer_time >= 0 && v.predictive_scaling_policy_configuration.scheduling_buffer_time <= 3600))
      )
    ])
    error_message = "must be between 0 and 3600"
  }
  validation {
    condition = alltrue([
      for k, v in var.appautoscaling_policies : (
        v.target_tracking_scaling_policy_configuration == null || (v.target_tracking_scaling_policy_configuration.customized_metric_specification == null || (v.target_tracking_scaling_policy_configuration.customized_metric_specification.metrics == null || alltrue([for item in v.target_tracking_scaling_policy_configuration.customized_metric_specification.metrics : (item.label == null || (length(item.label) >= 1 && length(item.label) <= 2047))])))
      )
    ])
    error_message = "must be between 1 and 2047 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appautoscaling_policies : (
        v.target_tracking_scaling_policy_configuration == null || (v.target_tracking_scaling_policy_configuration.customized_metric_specification == null || (v.target_tracking_scaling_policy_configuration.customized_metric_specification.metrics == null || alltrue([for item in v.target_tracking_scaling_policy_configuration.customized_metric_specification.metrics : (item.metric_stat == null || (length(item.metric_stat.stat) >= 1 && length(item.metric_stat.stat) <= 100))])))
      )
    ])
    error_message = "must be between 1 and 100 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.appautoscaling_policies : (
        v.target_tracking_scaling_policy_configuration == null || (v.target_tracking_scaling_policy_configuration.predefined_metric_specification == null || (v.target_tracking_scaling_policy_configuration.predefined_metric_specification.resource_label == null || (length(v.target_tracking_scaling_policy_configuration.predefined_metric_specification.resource_label) >= 0 && length(v.target_tracking_scaling_policy_configuration.predefined_metric_specification.resource_label) <= 1023)))
      )
    ])
    error_message = "must be between 0 and 1023 characters"
  }
  # Note: 15 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

