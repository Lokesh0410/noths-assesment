resource "aws_iam_role" "eventbridge_pipes_role" {
  name = "${var.username}-pipes-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "pipes.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "pipes_role_policy" {
  role   = aws_iam_role.eventbridge_pipes_role.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sqs:SendMessage",
          "sqs:ReceiveMessage",
          "sqs:DeleteMessage",
          "sqs:GetQueueAttributes"
        ]
        Resource = [
          module.basket_events_queue.queue_arn, 
          module.checkout_events_queue.queue_arn
        ]
      },
      {
        Effect = "Allow"
        Action = [
          "events:PutEvents",
          "events:DescribeEventBus"
        ]
        Resource = "*"
      }
    ]
  })
}
