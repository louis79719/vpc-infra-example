resource "aws_key_pair" "ec2_ssh_key" {
  key_name   = "${local.vpc_name}-ssh-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnrJkFJZ3sn5Bli+JABHI8oRKHbqoQOoFYYOmrTVSuD4kul/Fwb2uPEhYiy11qIPv2LjNCQK99wJUc7W6JOjYl7FXsV05fwGlcdnmOyk8CJF51YERFOrFeU8/f5nBq0K+Dmifi5rTjHv2W0UEeb95Z9Jo+vKlR2a10mykcDkxzPf7CX65FLBbTSRS+6VDRxtKx/4WADxMwHsEzZE22saxY6SzFWTJXuNL+nLP4d8zF6G7oS2XGFWKOd0MjVX7N+jPCE25wi1JOoYcfqGQn7wr1SIior4GjQT+akmgRatLXbNgjSpBJkz6A+SYZiQi614700hzl1z0aYvY2yLjCX+wb louis@L01015177.home"

  tags = {
    Name = "${local.vpc_name}-ssh-key"
  }
}
