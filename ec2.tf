data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  # Add the instance
  ami                  = data.aws_ami.ubuntu.id
  instance_type        = "t2.medium"
  availability_zone    = "ap-south-1a"
  tenancy              = "default"
  iam_instance_profile = aws_iam_instance_profile.test_profile.name
  key_name             = "cloud-patashala-sg"
  user_data            = file("script.sh")
  root_block_device {
    delete_on_termination = true
    volume_size           = "10"
    volume_type           = "gp3"
  }
  security_groups = [aws_security_group.allow_tls.name]
  tags = {
    Name = "My-Server"
  }
}
