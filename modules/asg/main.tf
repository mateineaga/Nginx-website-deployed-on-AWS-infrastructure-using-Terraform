resource "aws_autoscaling_group" "my_asg" {
  name                = "epam-tf-lab"
  desired_capacity    = 1
  min_size            = 1
  max_size            = 1
  vpc_zone_identifier = var.aws_subnets_from_compute

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  lifecycle {
    ignore_changes = [
      load_balancers,
      target_group_arns
    ]
  }

  tag {
    key                 = "Terraform"
    value               = "true"
    propagate_at_launch = true
  }
  tag {
    key                 = "Project"
    value               = "epam-tf-lab"
    propagate_at_launch = true
  }
  tag {
    key                 = "Owner"
    value               = "Matei_Neaga"
    propagate_at_launch = true
  }
}