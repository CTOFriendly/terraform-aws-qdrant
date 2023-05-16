
provider "aws" {
  region = var.region
}


data "aws_ami" "ubuntu_arm64" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-arm64-server-*"] 
  }
}


resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "example" {
  key_name = var.key_name
  public_key = tls_private_key.example.public_key_openssh
}


resource "aws_instance" "example" {
  ami = data.aws_ami.ubuntu_arm64.id
  instance_type = var.instance_type
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.example.id]
  subnet_id = aws_subnet.public.id
  private_ip = "10.0.0.12"
  root_block_device {
    volume_size = var.disk_size
  }

  tags = {
    Name = "QDrant"
  }
  user_data_replace_on_change = true
  user_data = "${file("${path.module}/init.sh")}"
}