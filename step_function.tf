resource "aws_sfn_state_machine" "logs_insights_workflow" {
  name     = "logs-insights-query-workflow"
  role_arn = aws_iam_role.sfn_execution_role.arn

  definition = jsonencode({
    "Comment" : "Query CloudWatch Logs Insights and send results to SNS",
    "StartAt" : "StartQuery",
    "States" : {
      "StartQuery" : {
        "Type" : "Task",
        "Resource" : "arn:aws:states:::aws-sdk:cloudwatchlogs:startQuery",
        "Parameters" : {
          "LogGroupName" : "$.logGroupName",
          "StartTime" : "$.startTime",
          "EndTime" : "$.endTime",
          "QueryString" : "$.queryString"
        },
        "Next" : "WaitForQuery"
      },
      "WaitForQuery" : {
        "Type" : "Wait",
        "Seconds" : 10,
        "Next" : "GetQueryResults"
      },
      "GetQueryResults" : {
        "Type" : "Task",
        "Resource" : "arn:aws:states:::aws-sdk:cloudwatchlogs:getQueryResults",
        "Parameters" : {
          "QueryId.$" : "$.queryId"
        },
        "Next" : "PublishToSNS"
      },
      "PublishToSNS" : {
        "Type" : "Task",
        "Resource" : "arn:aws:states:::aws-sdk:sns:publish",
        "Parameters" : {
          "TopicArn.$" : "$.snsTopicArn",
          "Message.$" : "States.JsonToString($.queryResults)"
        },
        "End" : true
      }
    }
  })
}

resource "aws_iam_role" "sfn_execution_role" {
  name = "step-functions-logs-query-role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "states.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "sfn_policy" {
  name = "step-functions-logs-query-policy"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "logs:StartQuery",
          "logs:GetQueryResults",
          "logs:DescribeLogGroups",
          "logs:DescribeLogStreams"
        ],
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "sns:Publish",
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "sfn_policy_attach" {
  role       = aws_iam_role.sfn_execution_role.name
  policy_arn = aws_iam_policy.sfn_policy.arn
}
