resource "aws_launch_template" "my_launch_template" {
  name          = "epam-tf-lab"
  description   = "My Launch Template"
  image_id      = "ami-04aa00acb1165b32a"
  instance_type = "t2.micro"

  iam_instance_profile {
    arn = "arn:aws:iam::851725346768:instance-profile/Matei-Neaga-01-Profile"
  }

  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [var.security_groups_ssh_from_compute, var.security_groups_http_lb_from_compute]
    subnet_id                   = element(tolist(var.aws_subnets_from_compute), var.random_integer)
  }

  key_name = "epam-tf-ssh-key"

  user_data = filebase64("${path.module}/user-data.sh")

  tag_specifications {
    resource_type = "instance"
    tags = {
      Project   = "epam-tf-lab"
      Terraform = "true"
      Owner     = "Matei_Neaga"
    }
  }

  tags = {
    Project   = "epam-tf-lab"
    Terraform = "true"
    Owner     = "Matei_Neaga"
  }
}