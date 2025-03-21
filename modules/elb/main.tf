resource "aws_elb" "my_elb" {
  name            = "elb-epam-tf-lab"
  security_groups = [var.security_groups_http_from_compute] 
  subnets         = var.aws_subnets_from_compute        

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  tags = {
    Terraform = "true"
    Project   = "epam-tf-lab"
    Owner     = "Matei_Neaga"
  }
}