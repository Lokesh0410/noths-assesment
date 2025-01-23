# EventBridge Integration Project

This repository implements an event-driven architecture using AWS EventBridge, SQS, and SNS. It provisions missing resources and connects pre-provisioned resources using Terraform.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed.
- AWS credentials configured.

## Steps to Deploy

1. Clone this repository:
   ```bash
   git clone https://github.com/<your-org>/eventbridge-integration-project.git


2. Import pre-provisioned resources:

cd eventbridge-integration-project
./scripts/import_resources.sh

3. Deploy the infrastructure:

./scripts/apply.sh

### Modules Used

aws_sqs_queue: Provisions the SQS queue.
aws_eventbridge_pipe: Configures EventBridge pipes.
aws_cloudwatch_rule: Creates EventBridge rules for routing events.

