variable "random_integer" {
    type = string
}

variable "aws_subnets_from_compute" {
    type = set(string)
}


variable "security_groups_ssh_from_compute" {
    type = string
}

variable "security_groups_http_lb_from_compute" {
    type = string
}

