locals {
  iam_instance_profile_name = "${data.terraform_remote_state.base.outputs.StudentName}-${data.terraform_remote_state.base.outputs.StudentSurname}-01-Profile"
  key_name                  = "epam-tf-ssh-key"
  s3_bucket_name            = "epam-tf-lab-${data.terraform_remote_state.base.outputs.random_number}"
}