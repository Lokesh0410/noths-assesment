terraform {
  backend "s3" {
    bucket = "noths-lab-recruitment-terraform"
    key    = "states/palace-deputy/terraform.state"
    region = "eu-west-1"
  }
}