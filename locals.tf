locals {
  alarms = {
    for alarm_name, definition in var.alarms :
    alarm_name => {
      alarm_name                = definition.alarm_name
      comparison_operator       = definition.comparison_operator
      evaluation_periods        = definition.evaluation_periods
      threshold                 = try(definition.threshold, null)
      alarm_description         = try(definition.alarm_description, null)
      insufficient_data_actions = try(definition.insufficient_data_actions, [])
      alarm_actions             = try(definition.alarm_actions, [])
      tags                      = try(definition.tags, {})
      metric_query              = try(definition.metric_query, null)
      return_data               = try(definition.return_data, null)
      # Simple configuration 
      metric_name = length(try(definition.metric_query, [])) == 0 ? try(definition.metric_name, null) : null
      namespace   = length(try(definition.metric_query, [])) == 0 ? try(definition.namespace, null) : null
      statistic   = length(try(definition.metric_query, [])) == 0 ? try(definition.statistic, null) : null
      period      = length(try(definition.metric_query, [])) == 0 ? try(definition.period, 180) : null
    }
  }
}