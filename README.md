# EventBridge Integration Project

This repository implements an event-driven architecture using AWS EventBridge, SQS, and SNS. It provisions missing resources and connects pre-provisioned resources using Terraform.

## Project Structure

eventbridge-integration-project/
├── main.tf              # Entry point for the Terraform configuration
├── variables.tf         # Input variables for the project
├── outputs.tf           # Outputs of the project
├── sqs.tf               # SQS queue resource definition
├── pipe.tf              # EventBridge pipes resource definitions
├── rule.tf              # CloudWatch Event Rule definitions
├── import.tf            # Resource definitions for pre-provisioned imports
├── scripts/             # Scripts for managing infrastructure
│   ├── import_resources.sh  # Script to import pre-provisioned resources
│   ├── apply.sh             # Helper script for applying Terraform
└── README.md            # Documentation for the project


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

