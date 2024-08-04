resource "aws_instance" "dev_environment" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_instance_profile
  tags                 = var.tags
}
