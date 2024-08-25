# Attach AdministratorAccess policy to the IAM group
resource "aws_iam_group_policy_attachment" "admin_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  group     = aws_iam_group.admin_group.name
  lifecycle {
    prevent_destroy = true
  }
}


