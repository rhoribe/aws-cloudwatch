alarms = {
  test = {
    alarm_name          = "terraform-test-foobar5"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods  = 2
    # metric_name               = "CPUUtilization"
    # namespace                 = "AWS/EC2"
    # period                    = 120
    # statistic                 = "Average"
    threshold                 = 80
    alarm_description         = "This metric monitors ec2 cpu utilization"
    insufficient_data_actions = []
    # metric_query              = []
    metric_query = [
      {
        id          = "m1"
        metric_name = "RequestCount"
        namespace   = "AWS/ApplicationELB"
        period      = 120
        stat        = "Sum"
        unit        = "Count"
        return_data = true
        dimensions = {
          LoadBalancer = "app/web"
        }
      },
      {
        id          = "m2"
        metric_name = "RequestCount-2"
        namespace   = "AWS/ApplicationELB"
        period      = 120
        stat        = "Sum"
        unit        = "Count"
        dimensions = {
          LoadBalancer = "app/web-2"
        }
      }
    ]
  }
}