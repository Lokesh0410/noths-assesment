# Data sources for existing SNS topics
data "aws_sns_topic" "basket_events" {
  name = "${var.username}-basket-events"
}

data "aws_sns_topic" "checkout_events" {
  name = "${var.username}-checkout-events"
}

# EventBridge Rule that will match events from both SNS topics
module "event_rule" {
  source         = "../../tf-shared/aws_cloudwatch_rule"
  description    = "Event rule for eventbridge-integration-project"
  rule_name      = "${var.username}-event-rule"
  event_bus_name = "default"
  event_pattern  = jsonencode({
    "source" = [
      data.aws_sns_topic.basket_events.arn,
      data.aws_sns_topic.checkout_events.arn
    ]
  })
  target_arn     = module.basket_events_queue.queue_arn  # Use the final destination SQS queue ARN
  environment    = var.environment
  tags = {
    Environment = var.environment
    Team        = var.team
  }
}
