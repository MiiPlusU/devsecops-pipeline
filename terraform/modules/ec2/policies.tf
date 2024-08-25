resource "aws_iam_role_policy_attachment" "this" {
  for_each   = toset(var.policy_arns)
  role       = aws_iam_role.ec2_role.name
  policy_arn  = each.value
}
