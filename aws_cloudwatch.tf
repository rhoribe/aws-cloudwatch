resource "aws_cloudwatch_metric_alarm" "this" {
  for_each                  = local.alarms
  alarm_name                = each.value.alarm_name
  comparison_operator       = each.value.comparison_operator
  evaluation_periods        = each.value.evaluation_periods
  threshold                 = each.value.threshold
  alarm_description         = each.value.alarm_description
  insufficient_data_actions = each.value.insufficient_data_actions
  alarm_actions             = each.value.alarm_actions
  tags                      = each.value.tags

  # Simple configuration
  metric_name = each.value.metric_name
  namespace   = each.value.namespace
  statistic   = each.value.statistic
  period      = each.value.period

  # Advance configuration
  dynamic "metric_query" {
    for_each = try(each.value.metric_query, [])
    content {
      id          = metric_query.value.id
      return_data = metric_query.value.return_data
      metric {
        metric_name = metric_query.value.metric_name
        namespace   = metric_query.value.namespace
        period      = metric_query.value.period
        stat        = metric_query.value.stat
        unit        = try(metric_query.value.unit, null)
        dimensions  = try(metric_query.value.dimensions, {})
      }
    }
  }
}