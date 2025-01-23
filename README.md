# EventBridge Integration Project

This repository implements an event-driven architecture using AWS EventBridge, SQS, and SNS. It provisions missing resources and connects pre-provisioned resources using Terraform.

Steps followed from repo: 
https://github.com/notonthehighstreet/team-pre-interview-technical-task

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed.
- AWS credentials configured.

### Modules Used

aws_sqs_queue: Provisions the SQS queue.
aws_eventbridge_pipe: Configures EventBridge pipes.
aws_cloudwatch_rule: Creates EventBridge rules for routing events.

