# Create SQS Queues for EventBridge Pipes source (SNS -> SQS)
module "basket_events_queue" {
  source     = "../../tf-shared/aws_sqs_queue"
  queue_name = "${var.username}-basket-events-queue"
  environment = var.environment
  username   = var.username
}

module "checkout_events_queue" {
  source     = "../../tf-shared/aws_sqs_queue"
  queue_name = "${var.username}-checkout-events-queue"
  environment = var.environment
  username   = var.username
}

# Subscribe SNS topics to SQS queues
resource "aws_sns_topic_subscription" "basket_sns_to_sqs" {
  topic_arn = data.aws_sns_topic.basket_events.arn
  protocol  = "sqs"
  endpoint  = module.basket_events_queue.queue_arn
}

resource "aws_sns_topic_subscription" "checkout_sns_to_sqs" {
  topic_arn = data.aws_sns_topic.checkout_events.arn
  protocol  = "sqs"
  endpoint  = module.checkout_events_queue.queue_arn
}
