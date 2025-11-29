# AWS Lambda Function Concept

## What is Lambda?
AWS Lambda is a serverless compute service that runs code in response to events without provisioning or managing servers.

## Key Features
- Event-driven execution
- Automatic scaling
- Pay only for execution time
- Supports multiple runtimes (Python, Node.js, Java, Go)

## Common Automation Use Cases
- Triggering workflows when files are uploaded to S3
- Processing DynamoDB streams
- Running scheduled tasks via CloudWatch Events
- Integrating with CI/CD pipelines for lightweight automation

## Limitations
- Max execution time: 15 minutes
- Stateless by design
- Requires external storage for persistence

## Automation Use Cases for AWS Lambda

AWS Lambda is designed for event-driven automation. Here are common scenarios where Lambda adds value:

- **S3 Event Processing**
  - Trigger Lambda when a file is uploaded to an S3 bucket.
  - Example: Automatically resize images, convert file formats, or move data to another bucket.

- **Log Cleanup / Rotation**
  - Use CloudWatch Events to trigger Lambda nightly.
  - Example: Archive old logs or delete temporary files without needing a server.

- **CI/CD Notifications**
  - Trigger Lambda when a GitHub webhook or CodePipeline event occurs.
  - Example: Send Slack or Teams notifications when a build succeeds or fails.

- **Database Automation**
  - Trigger Lambda from DynamoDB Streams.
  - Example: Update a secondary table, push changes to Elasticsearch, or run validation logic.

- **Scheduled Tasks**
  - Use EventBridge (CloudWatch Scheduler) to run Lambda on a cron-like schedule.
  - Example: Generate daily reports, sync data between services, or check system health.

- **Security Automation**
  - Trigger Lambda when CloudTrail logs a sensitive API call.
  - Example: Automatically revoke keys, quarantine resources, or alert administrators.
