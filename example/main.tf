terraform {
  backend "s3" {
    bucket = "hi1280-tfstate-main"
    key    = "terraform-auto-apply-example.tfstate"
    region = "ap-northeast-1"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}