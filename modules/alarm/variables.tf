variable "metric_name" {
  type = string
  description = "name of metric on which alarm is based"
}

variable "alarm_description" {
  type = string
  description = "purpose of alarm"
}

variable "period" {
  type = number
  description = "period over which CLoudWatch will aggregate results"
  default = 60
}

variable "threshold" {
  type = number
  description = "alerting threshold"
  default = 0
}

variable "sns_topic_arn" {
  type = string
  description = "arn for sns topic"
}

variable "lambda_arn" {
  type = string
  description = "arn for alert notification lambda"
}

variable "log_group_name" {
  type = string
  description = "name of GitHub audit log events CloudWath log group"
  default = "/aws/lambda/GitHubIngestFunction"
}

variable "metric_filter_pattern" {
  type = object({
    usernames_equal_to    = optional(list(string), [])
    usernames_not_equal_to = optional(list(string), [])
    repositories          = optional(list(string), [])
    events                = optional(list(string), [])
    organisations         = optional(list(string), [])
  })

  description = "Filter pattern used to create metric"
}
