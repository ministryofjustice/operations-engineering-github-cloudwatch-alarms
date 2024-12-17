import boto3
import os
import datetime

logs_client = boto3.client('logs')
sns_client = boto3.client('sns')

def convert_time(iso_time):
    try:
        dt = datetime.datetime.fromisoformat(iso_time.replace('Z', '+00:00'))
        return int(dt.timestamp() * 1000)
    except Exception as e:
        return {"statusCode": 500, "body": f"Error converting time: {e}"}

def lambda_handler(event, context):
    try:
        response = logs_client.filter_log_events(
            logGroupName=os.environ['LOG_GROUP_NAME'],
            filterPattern=event['queryString'],
            startTime=convert_time(event['time']) - int(event['period']),
            endTime=convert_time(event['time']),
        )
    except Exception as e:
        return {"statusCode": 500, "body": f"Error fetching log events: {e}"}
    
    events = response.get('events', [])
    message = "\n".join([event['message'] for event in events])
    final_message = f"CloudWatch Alarm Triggered. Log Events:\n{message}"

    if not events:
        return {"statusCode": 200, "body": "No log events found."}

    try:
        sns_client.publish(
            TopicArn=event['snsTopicArn'],
            Subject=f"CloudWatch Alarm Triggered: {event['alarmName']}",
            Message=final_message
        )
    except Exception as e:
        return {"statusCode": 500, "body": f"Error publishing SNS notification: {e}"}

    return {"statusCode": 200, "body": "Notification sent successfully."}