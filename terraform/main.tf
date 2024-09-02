provider "aws" {
  region = "us-east-2"
}

resource "aws_key_pair" "key_pair" {
  key_name = "my_key_pair"
  public_key = file("~/.ssh/id_rsa.pub")
}
