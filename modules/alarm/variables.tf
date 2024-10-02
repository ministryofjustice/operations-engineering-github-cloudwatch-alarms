variable "metric_name" {
  type = string
  description = "name of metric on which alarm is based"
}

variable "alarm_name" {
  type = string
  description = "name of alarm"
}

variable "alarm_description" {
  type = string
  description = "purpose of alarm"
}

variable "metric_filter_pattern" {
  type = string
  description = "pattern for CloudWatch metric filter"
}

variable "team" {
  type = string
  description = "team associated with alarms"
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

variable "subscribers" {
  type = list(string)
  description = "email subscribers to sns topic"
}



