resource "aws_key_pair" "deployer" {
  key_name   = "epam-tf-ssh-key"
  public_key = var.ssh_key
  tags = {
    Terraform = "true"
    Project   = "epam-tf-lab"
    Owner     = "${data.terraform_remote_state.base.outputs.StudentName}_${data.terraform_remote_state.base.outputs.StudentSurname}"
  }
}