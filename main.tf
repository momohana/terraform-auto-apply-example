terraform {
  backend "s3" {
    bucket = "momohana-tfstate-main"
    key    = "terraform-auto-apply.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region = "us-west-2"
}

data "aws_caller_identity" "current" {}
