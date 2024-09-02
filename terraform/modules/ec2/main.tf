resource "aws_instance" "this" {
  ami                  = var.ami_id
  instance_type        = var.type
  iam_instance_profile = aws_iam_instance_profile.this.name
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.dev_env_sg.id]
  root_block_device {
    volume_type           = "gp2"
    volume_size           = 8
    # delete_on_termination = false
  }
  tags                 = var.tags
}

resource "aws_iam_instance_profile" "this" {
  name = "EC2InstanceProfile"
  role = aws_iam_role.ec2_role.name
}