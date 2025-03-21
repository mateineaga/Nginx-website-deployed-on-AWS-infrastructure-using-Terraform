variable "StudentName" {
  type    = string
  default = "Matei"
}

variable "StudentSurname" {
  type    = string
  default = "Neaga"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "random_number" {
  type = string
}

locals {
  vpc_name         = "${var.StudentName}-${var.StudentSurname}-01-vpc"
  igw_name         = "${var.StudentName}-${var.StudentSurname}-01-igw"
  route_table_name = "${var.StudentName}-${var.StudentSurname}-01-rt"

  subnets = {
    "a" = { name = "${var.StudentName}-${var.StudentSurname}-01-subnet-public-a", cidr = "10.10.1.0/24", az = "${var.region}a" }
    "b" = { name = "${var.StudentName}-${var.StudentSurname}-01-subnet-public-b", cidr = "10.10.3.0/24", az = "${var.region}b" }
    "c" = { name = "${var.StudentName}-${var.StudentSurname}-01-subnet-public-c", cidr = "10.10.5.0/24", az = "${var.region}c" }
  }

  tags = {
    Terraform = "true"
    Project   = "epam-tf-lab"
    Owner     = "${var.StudentName}_${var.StudentSurname}"
  }
}