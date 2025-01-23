# Data source for the Event Bus
data "aws_cloudwatch_event_bus" "user_event_bus" {
  name = "${var.username}-domain-events"
}

# Create EventBridge Pipe for Basket Events -> Event Bus
module "basket_to_bus_pipe" {
  source     = "../../tf-shared/aws_eventbridge_pipe"
  pipe_name  = "${var.username}-basket-to-bus"
  username   = var.username 
  source_arn = module.basket_events_queue.queue_arn
  target_arn = data.aws_cloudwatch_event_bus.user_event_bus.arn
  role_arn   = aws_iam_role.eventbridge_pipes_role.arn
  environment = var.environment
  additional_tags = {
    Team = var.team
  }
}

# Create EventBridge Pipe for Checkout Events -> Event Bus
module "checkout_to_bus_pipe" {
  source     = "../../tf-shared/aws_eventbridge_pipe"
  pipe_name  = "${var.username}-checkout-to-bus"
  username   = var.username
  source_arn = module.checkout_events_queue.queue_arn
  target_arn = data.aws_cloudwatch_event_bus.user_event_bus.arn
  role_arn   = aws_iam_role.eventbridge_pipes_role.arn
  environment = var.environment
  additional_tags = {
    Team = var.team
  }
}
