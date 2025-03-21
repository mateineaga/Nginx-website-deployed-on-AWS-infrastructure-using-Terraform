resource "aws_iam_role" "test-import" {
  name = "test-import"

  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action    = "sts:AssumeRole"
          Condition = {}
          Effect    = "Allow"
          Principal = {
            AWS = "arn:aws:iam::851725346768:root"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )

  tags = {
    Terraform = "true"
    Project   = "epam-tf-lab"
    Owner     = "${data.terraform_remote_state.base.outputs.StudentName}_${data.terraform_remote_state.base.outputs.StudentSurname}"
  }
}


