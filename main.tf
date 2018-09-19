terraform {
  backend "s3" {
    bucket = "raizza-website-infrastructure.raidrin.com"
    key = "state/jenkins.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.aws_region}"
}
