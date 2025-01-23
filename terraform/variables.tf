variable "username" {
  description = "Unique username prefix for resource naming."
  type        = string
  default     = "palace-deputy"
}

variable "environment" {
  description = "The environment for deployment (e.g., dev, staging, prod)."
  type        = string
  default     = "dev"
}

variable "team" {
  description = "Team or owner tag for resources."
  type        = string
  default     = "platform-team"
}

variable "region" {
  description = "AWS region where resources will be deployed."
  type        = string
  default     = "eu-west-1"
}

variable "sns_topics" {
  description = "List of pre-existing SNS topics to fetch dynamically."
  type        = list(string)
  default     = [
    "basket-events",
    "checkout-events"
  ]
}

variable "visibility_timeout" {
  description = "Visibility timeout for SQS queues (in seconds)."
  type        = number
  default     = 30
}

variable "pipe_execution_role_name" {
  description = "IAM role name for EventBridge Pipe execution."
  type        = string
  default     = "pipe-execution-role"
}

variable "tags" {
  description = "Common tags for all resources."
  type        = map(string)
  default     = {
    Environment = "dev"
    Team        = "noths-platform-team"
  }
}
