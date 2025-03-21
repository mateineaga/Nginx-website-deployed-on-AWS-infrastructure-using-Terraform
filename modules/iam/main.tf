resource "aws_iam_group" "matei_neaga_iam_group" {
  name = "${var.StudentName}-${var.StudentSurname}-01-group"

}

resource "aws_iam_policy" "matei_neaga_iam_policy" {
  name        = "write-to-epam-tf-lab"
  description = "Writing policy to Matei Neaga"

  policy = templatefile("${path.module}/files/iam-policy.tftpl", { rand = var.random_number })

  tags = merge(local.tags)
}

resource "aws_iam_policy" "my_policy" {
  name        = "MyPolicy"
  description = "Allow GetCallerIdentity"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow"
        Action   = "sts:GetCallerIdentity"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role" "matei_neaga_iam_role" {
  name = "${var.StudentName}-${var.StudentSurname}-01-role"

  assume_role_policy = file("${path.module}/files/assume-role-policy.json")

  inline_policy {
    name   = "write-to-epam-tf-lab"
    policy = templatefile("${path.module}/files/iam-policy.tftpl", { rand = var.random_number })
  }

  tags = merge(local.tags)
}

resource "aws_iam_role_policy_attachment" "my_role_policy_attachment" {
  policy_arn = aws_iam_policy.my_policy.arn
  role       = aws_iam_role.matei_neaga_iam_role.name
}

resource "aws_iam_instance_profile" "matei_neaga_iam_profile" {
  name = "${var.StudentName}-${var.StudentSurname}-01-Profile"
  role = aws_iam_role.matei_neaga_iam_role.name
}