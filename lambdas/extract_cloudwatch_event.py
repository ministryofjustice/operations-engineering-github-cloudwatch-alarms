import boto3
import os
from datetime import datetime
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)
logs_client = boto3.client('logs')
sns_client = boto3.client('sns')

def lambda_handler(event, context):
    logger.info("Starting processing...")
    logger.info(f"Event: {event}")

    try:
        logger.info("Querying CloudWatch logs")

        time_now = int(datetime.utcnow().timestamp())

        query = {
            "logGroupName": os.environ['LOG_GROUP_NAME'],
            "filterPattern": event['queryString'],
            "startTime": time_now - int(event['period']),
            "endTime": time_now,
        }

        logger.info(f"Query: {query}")

        response = logs_client.filter_log_events(**query)

        logger.info("Finished querying CloudWatch logs")
    except Exception as e:
        logger.error(f"Error fetching log events: {e}")
        return {"statusCode": 500, "body": f"Error fetching log events: {e}"}
    
    events = response.get('events', [])
    message = "\n".join([event['message'] for event in events])
    final_message = f"CloudWatch Alarm Triggered. Log Events:\n{message}"

    if not events:
        logger.info("No log events found.")
        return {"statusCode": 200, "body": "No log events found."}

    try:
        logger.info("Publsihing message to SNS")
        sns_client.publish(
            TopicArn=event['snsTopicArn'],
            Subject=f"CloudWatch Alarm Triggered: {event['alarmName']}",
            Message=final_message
        )
        logger.info("Notification sent successfully.")
    except Exception as e:
        logger.error(f"Error publishing SNS notification: {e}")
        return {"statusCode": 500, "body": f"Error publishing SNS notification: {e}"}

    return {"statusCode": 200, "body": "Notification sent successfully."}