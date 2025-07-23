# Ensures EC2 instances wear their tags proudly, with non-compliance sparking an email alert via SNS and CloudWatch Events. 

# Create an SNS topic to send compliance alerts
resource "aws_sns_topic" "config_alerts" {
  name = "config-noncompliance-alerts" # Name of the SNS topic
}

# Subscribe an email address to the SNS topic
resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.config_alerts.arn # Link the subscription to the SNS topic
  protocol  = "email"                         # Use email protocol for notifications
  endpoint  = "your-email@example.com"        # Replace with your email to receive alerts
}

# Create an AWS Config rule to enforce required tags
resource "aws_config_config_rule" "required_tags" {
  name = "required-tags" # Name of the config rule

  source {
    owner             = "AWS"           # This is a managed AWS rule
    source_identifier = "REQUIRED_TAGS" # AWS-provided rule to check for required tags
  }

  # Specify which tag keys must exist on the resource
  input_parameters = jsonencode({
    Tag1Key = "Owner",      # Required tag key 1
    Tag2Key = "Project",    # Required tag key 2
    Tag3Key = "Environment" # Required tag key 3
  })

  scope {
    compliance_resource_types = ["AWS::EC2::Instance"] # Apply this rule only to EC2 instances
  }

  # Make sure the email subscription is created before this rule
  depends_on = [aws_sns_topic_subscription.email_alert]
}

# Create a CloudWatch Event Rule to catch NON_COMPLIANT results from the AWS Config rule
resource "aws_cloudwatch_event_rule" "config_noncompliant" {
  name        = "config-rule-noncompliance"                          # Name of the event rule
  description = "Trigger when AWS Config rule becomes NON_COMPLIANT" # Description

  event_pattern = jsonencode({
    source = ["aws.config"],                            # Source is AWS Config
    "detail-type" : ["Config Rules Compliance Change"], # Listen for config rule compliance change
    detail = {
      newEvaluationResult = {
        complianceType = ["NON_COMPLIANT"] # Trigger only when the result is NON_COMPLIANT
      },
      configRuleName = [aws_config_config_rule.required_tags.name] # Only for our defined config rule
    }
  })
}

# Send an SNS notification when the CloudWatch Event Rule is triggered
resource "aws_cloudwatch_event_target" "sns_target" {
  rule      = aws_cloudwatch_event_rule.config_noncompliant.name # Link to the event rule
  target_id = "send-to-sns"                                      # Identifier for the target
  arn       = aws_sns_topic.config_alerts.arn                    # Send the event to the SNS topic
}
