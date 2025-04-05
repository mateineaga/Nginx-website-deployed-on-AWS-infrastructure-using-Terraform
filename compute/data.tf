data "terraform_remote_state" "base" {
  backend = "local"

  config = {
    path = "${path.module}/../base/terraform.tfstate"
  }
}

# Get AWS Account ID
data "aws_caller_identity" "current" {}

# Get AWS Region
data "aws_region" "current" {}

# Get VPC ID
data "aws_vpc" "main" {
  id = "vpc-05c81a18f33f088ac"
}

# Get Public Subnets (Previously from outputs.tf)
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
}

# Get Security Groups (Previously from outputs.tf)
data "aws_security_group" "ssh" {
  filter {
    name   = "group-name"
    values = ["ssh-inbound"]
  }
}

data "aws_security_group" "http" {
  filter {
    name   = "group-name"
    values = ["lb-http-inbound"]
  }
}

data "aws_security_group" "http_lb" {
  filter {
    name   = "group-name"
    values = ["http-inbound"]
  }
}


