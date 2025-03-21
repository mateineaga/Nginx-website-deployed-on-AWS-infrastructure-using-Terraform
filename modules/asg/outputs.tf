output "asg_name" {
    description = "ASG name"
    value = aws_autoscaling_group.my_asg.name
}