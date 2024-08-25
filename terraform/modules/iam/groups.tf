resource "aws_iam_group" "admin_group" {
  name = "admin"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_user_group_membership" "admin_user_to_group" {
  user  = aws_iam_user.admin_user.name
  groups = [aws_iam_group.admin_group.name]
  lifecycle {
    prevent_destroy = true
  }
}