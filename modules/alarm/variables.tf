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

variable "metric_filter_pattern" {
  type = object({
    usernames_equal_to   = list(string)
    usernames_not_equal_to = list(string)
    repositories = list(string)
    events      = list(string)
    organisations = list(string)
  })

  default = {
    usernames = []
    repositories = []
    events = []
    organisations = []
  }

  description = "filter pattern used to create metric"
}

