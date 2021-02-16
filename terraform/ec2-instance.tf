resource "aws_security_group" "allow_internal_traffic" {
  name        = "allow_internal_traffic"
  description = "Allow all internal inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "internal"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = [local.vpc_cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_internal_traffic"
  }
}

resource "aws_security_group" "allow_all_ssh" {
  name        = "allow_all_ssh"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all_ssh"
  }
}

resource "aws_instance" "public" {
  ami           = "ami-0a6dc7529cd559185" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.nano"

  key_name  = aws_key_pair.ec2_ssh_key.key_name
  subnet_id = aws_subnet.public.id

  security_groups = [
    aws_security_group.allow_internal_traffic.id,
    aws_security_group.allow_all_ssh.id,
  ]

  tags = {
    Name = "public-ec2-instance"
  }
}

resource "aws_instance" "private" {
  ami           = "ami-0a6dc7529cd559185" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t2.nano"

  key_name  = aws_key_pair.ec2_ssh_key.key_name
  subnet_id = aws_subnet.private.id
  security_groups = [
    aws_security_group.allow_internal_traffic.id
  ]

  tags = {
    Name = "private-ec2-instance"
  }
}