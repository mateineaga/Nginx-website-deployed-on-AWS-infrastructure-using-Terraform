output "elb_id" {
    description = "ID of ELB"
    value = aws_elb.my_elb.id
}