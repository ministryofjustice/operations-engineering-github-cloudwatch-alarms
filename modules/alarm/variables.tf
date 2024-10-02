variable "metric_name" {
  type = string
  description = "name of metric on which alarm is based"
}

variable "alarm_description" {
  type = string
  description = "purpose of alarm"
}

variable "metric_filter_pattern" {
  type = string
  description = "pattern for CloudWatch metric filter"
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

