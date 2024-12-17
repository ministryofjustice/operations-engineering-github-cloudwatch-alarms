output "sns_topic_arn" {
  description = "arn of sns topic"
  value       = aws_sns_topic.default.arn
}