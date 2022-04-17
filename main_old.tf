/*
provider "aws" {
    # we're going to have to switch to named profiles 
    region = var.aws_franken_node_region
}

data "aws_ami" "jenkins-server" {
  most_recent = true

  # wtf is filter again?
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "jenkins-server" {
  ami           = data.aws_ami.jenkins-server.id
  instance_type = var.aws_franken_node_instance_type

  tags = {
    Name = var.aws_franken_node_instance_name
  }
}
*/