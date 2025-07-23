# Terraform Demos: AWS Automation Examples

Welcome to the Terraform demos repository! This collection showcases practical examples of using Terraform to automate various AWS services. Each example demonstrates a specific use case, providing a hands-on approach to infrastructure as code.

---

## Example 1: AWS Scheduler for EC2 Instance Management

**File:** `example1.tf`  
This configuration sets up an AWS Scheduler to automatically start an EC2 instance every Monday at 9:00 AM UTC. It uses a cron expression to define the schedule and invokes the `startInstances` API for the specified EC2 instance.

**Key Features:**
- Automates EC2 instance management.
- Uses AWS Scheduler for precise task scheduling.
- Demonstrates integration with IAM roles for permissions.

---

## Example 2: AWS Cost Budget with Notifications

**File:** `example2.tf`  
This configuration defines a monthly cost budget of $500 for your AWS account. It includes detailed cost types and sends email notifications when the actual spend exceeds 90% of the budget.

**Key Features:**
- Tracks AWS costs with a defined budget.
- Sends alerts when spending approaches the threshold.
- Includes comprehensive cost type configurations.

---

## Example 3: AWS Config Rule for Tag Compliance

**File:** `example3.tf`  
This configuration enforces tag compliance for EC2 instances using AWS Config. It triggers an email alert via SNS and CloudWatch Events whenever an instance is non-compliant with the required tags.

**Key Features:**
- Ensures EC2 instances have mandatory tags.
- Sends real-time alerts for non-compliance.
- Demonstrates integration of AWS Config, SNS, and CloudWatch Events.

---

## How to Use

1. Clone this repository to your local machine.
2. Navigate to the desired example directory.
3. Update the configurations (e.g., email addresses, instance IDs) as needed.
4. Run `terraform init` to initialize the working directory.
5. Apply the configuration using `terraform apply`.

---

## Prerequisites

- Terraform installed on your local machine.
- AWS CLI configured with appropriate credentials.
- Necessary permissions to create and manage AWS resources.

---

Explore these examples to learn how Terraform can simplify AWS resource management and automation. Happy coding!
