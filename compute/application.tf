module "launch_template" {
  source = "D:\\github\\Nginx-website-deployed-on-AWS-infrastructure-using-Terraform\\modules\\launch_template"

  random_integer                       = random_integer.subnet.result
  aws_subnets_from_compute             = data.aws_subnets.public.ids
  security_groups_ssh_from_compute     = data.aws_security_group.ssh.id
  security_groups_http_lb_from_compute = data.aws_security_group.http_lb.id
}

module "asg" {
  source = "D:\\github\\Nginx-website-deployed-on-AWS-infrastructure-using-Terraform\\modules\\asg"

  aws_subnets_from_compute = data.aws_subnets.public.ids
  launch_template_id       = module.launch_template.launch_template_id
}

module "elb" {
  source = "D:\\github\\Nginx-website-deployed-on-AWS-infrastructure-using-Terraform\\modules\\elb"

  aws_subnets_from_compute          = data.aws_subnets.public.ids
  security_groups_http_from_compute = data.aws_security_group.http.id
}

# Attach the ELB to the Auto Scaling group
resource "aws_autoscaling_attachment" "my_asg_attachment" {
  autoscaling_group_name = module.asg.asg_name
  elb                    = module.elb.elb_id
}
