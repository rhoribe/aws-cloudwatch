variable "alarms" {
  type = map(object({
    alarm_name                = string
    comparison_operator       = string
    evaluation_periods        = number
    threshold                 = optional(number)
    alarm_description         = optional(string)
    insufficient_data_actions = optional(list(string))
    alarm_actions             = optional(list(string))
    metric_query = optional(list(object({
      id          = string
      metric_name = string
      namespace   = string
      period      = number
      stat        = string
      unit        = optional(string)
      dimensions  = optional(map(string))
      return_data = optional(bool)
    })))
    metric_name = optional(string)
    namespace   = optional(string)
    statistic   = optional(string)
    tags = optional(map(string)
    )
  }))
}