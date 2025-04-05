terraform {
  backend "s3" {
    region = "us-east-1"
    bucket = "epam-aws-tf-state-5"
    key    = "compute/terraform.tfstate"
    # use_lockfile = true
    dynamodb_table = "epam-aws-tf-state-dynamo"
  }
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["D:\\github\\Nginx-website-deployed-on-AWS-infrastructure-using-Terraform\\.aws\\credentials"]
}