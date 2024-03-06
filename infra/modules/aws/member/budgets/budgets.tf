resource "aws_budgets_budget" "cost" {
  budget_type  = "COST"
  limit_amount = "200"
  limit_unit   = "USD"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["forrestmillerj@gmail.com"]
  }
}
