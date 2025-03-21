resource "aws_security_group" "ssh" {
  name        = "ssh-inbound"
  description = "allows ssh access from safe IP-range"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["86.121.12.17/32"]
  }

  egress {
    description = "all traffic egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, { Name = "ssh-inbound" })
}

# resource "aws_security_group_rule" "allow_ssh" {
#   type              = "ingress"
#   description       = "SSH ingress"
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   cidr_blocks       = ["86.121.12.17/32"]
#   security_group_id = aws_security_group.ssh.id
# }

# resource "aws_security_group_rule" "allow_all_traffic_ssh" {
#   type              = "egress"
#   description       = "all traffic egress"
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.ssh.id
# }

resource "aws_security_group" "http-to-lb" {
  name        = "lb-http-inbound"
  description = "allows http access from safe IP-range to a LoadBalancer"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["86.121.12.17/32"] # Replace with your IP or EPAM Office IP range
  }

  egress {
    description = "all traffic egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, { Name = "http-to-lb" })
}


resource "aws_security_group" "http-from-lb" {
  name        = "http-inbound"
  description = "allows http access from LoadBalancer"
  vpc_id      = var.vpc_id

  ingress {
    description     = "HTTP ingress from LoadBalancer"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.http-to-lb.id] # Allow traffic from the LoadBalancer SG
  }

  egress {
    description = "all traffic egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, { Name = "http-from-lb" })
}
