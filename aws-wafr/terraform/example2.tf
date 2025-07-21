# Setting up a cost budget in AWS using Terraform

# Define a cost budget using AWS Budgets
resource "aws_budgets_budget" "monthly_budget" {
  name         = "monthly-cost-budget" # Name of the budget
  budget_type  = "COST"                # Budget is based on actual cost (can also be USAGE or RI_UTILIZATION)
  limit_amount = "500"                 # Set the budget threshold limit to $500
  limit_unit   = "USD"                 # Currency is in US Dollars
  time_unit    = "MONTHLY"             # Budget resets every month

  # Optional: Apply budget only to a specific AWS linked account (in case of consolidated billing)
  cost_types {
    include_credit             = true # Include credits in the budget calculation
    include_discount           = true # Include discounts in the budget calculation
    include_other_subscription = true # Include other subscription costs
    include_recurring          = true # Include recurring fees
    include_refund             = true # Include refunds
    include_subscription       = true # Include subscription costs
    include_support            = true # Include support charges
    include_tax                = true # Include taxes
    include_upfront            = true # Include upfront costs
  }

  # Define the notification settings
  notification {
    comparison_operator        = "GREATER_THAN" # Trigger notification when cost exceeds threshold
    threshold                  = 90             # Threshold set to 90% of the budget ($450 in this case)
    threshold_type             = "PERCENTAGE"   # Threshold is calculated as a percentage
    notification_type          = "ACTUAL"       # Based on actual spend (can also be FORECASTED)
    subscriber_email_addresses = "alerts@example.com"
  }
}