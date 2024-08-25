resource "aws_iam_user" "admin_user" {
  name = "terraform-user"

  lifecycle {
    prevent_destroy = true
  }
}
