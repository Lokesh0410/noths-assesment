terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.33.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      Application = "app-to-get-lokesh-selected-for-a-role-at-noths"
      Owner       = "NotOnTheHighStreet"
    }
  }
}
