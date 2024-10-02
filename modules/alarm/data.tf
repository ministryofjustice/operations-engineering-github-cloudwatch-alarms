data "aws_cloudwatch_log_group" "github_events_log_group" {
  name = "/aws/lambda/GitHubIngestFunction"
}