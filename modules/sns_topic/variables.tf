variable "team" {
  type = string
  description = "team name e.g. operations-engineering"
}

variable "subscribers" {
  type = list(string)
  description = "list of email subscribers"
}