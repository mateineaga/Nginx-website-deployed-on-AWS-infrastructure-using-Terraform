provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["D:\\github\\Nginx-website-deployed-on-AWS-infrastructure-using-Terraform\\.aws\\credentials"]
}

module "network" {
  source = "D:\\github\\Nginx-website-deployed-on-AWS-infrastructure-using-Terraform\\modules\\network"
}

module "network_security" {
  source = "D:\\github\\Nginx-website-deployed-on-AWS-infrastructure-using-Terraform\\modules\\network_security"

  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.public_subnet_ids
}

module "iam" {
  source        = "D:\\github\\Nginx-website-deployed-on-AWS-infrastructure-using-Terraform\\modules\\iam"
  random_number = random_string.my_numbers.result
}

terraform {
  backend "s3" {
    region         = "us-east-1"
    bucket         = "epam-aws-tf-state-5"
    key            = "base/terraform.tfstate"
    dynamodb_table = "epam-aws-tf-state-dynamo"
  }
}

