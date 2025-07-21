# This Terraform configuration sets up an AWS Scheduler to run a task that starts an EC2 instance on a weekly schedule.

# Define an AWS Scheduler schedule resource
resource "aws_scheduler_schedule" "my_scheduler" {
  name       = "my-scheduler" # Name of the scheduler
  group_name = "default"      # Group under which this schedule is organized (default is standard)

  flexible_time_window {
    mode = "OFF" # Disables flexible time window to ensure exact timing for the schedule
  }

  # Cron expression to run the task at 9:00 AM (UTC) every Monday
  # Format: cron(Minutes Hours Day-of-month Month Day-of-week Year)
  schedule_expression = "cron(0 9 ? * MON *)"

  target {
    # ARN of the service to invoke; here it's the EC2 service with 'startInstances' API
    arn = "arn:aws:scheduler:::aws-sdk:ec2:startInstances"

    # IAM role used by the scheduler to assume permissions for the target action
    role_arn = aws_iam_role.my_role.arn

    # Input passed to the EC2 'startInstances' API; here it includes the EC2 instance ID to start
    input = jsonencode({
      InstanceIds = [
        aws_instance.my_ec2.id # Refers to an EC2 instance defined elsewhere in your Terraform code
      ]
    })
  }
}
