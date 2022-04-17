variable "awsprops" {
    // type = "map", I think it's implied?
    default = {
    region = "us-west-1"
    vpc = "vpc-5234832d" // let's use the default for now
    ami = "ami-0c02fb55956c7d316" // does the instance have to be initialized first? // "ami-0c1bea58988a989155" // Invalid id: ami-0c1bea58988a989155 
    instance_type = "t2.micro"
    subnet = "subnet-81896c8e"
    publicip = true
    keyname = "myseckey"
    secgroupname = "IAC-Sec-Group"
  }
}

provider "aws" {
  region = lookup(var.awsprops, "region")
}

/*
resource "aws_security_group" "project-iac-sg" {
  name = lookup(var.awsprops, "secgroupname")
  description = lookup(var.awsprops, "secgroupname")
  // vpc_id = lookup(var.awsprops, "vpc") 

  // To Allow SSH Transport
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow Port 80 Transport
  ingress {
    from_port = 80
    protocol = ""
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}
*/

resource "aws_instance" "jenskins-server" {
  ami = lookup(var.awsprops, "ami")
  instance_type = lookup(var.awsprops, "instance_type")
  // subnet_id = lookup(var.awsprops, "subnet") #FFXsubnet2
  // associate_public_ip_address = lookup(var.awsprops, "publicip")
  // key_name = lookup(var.awsprops, "keyname")

  /*
  vpc_security_group_ids = [
    aws_security_group.project-iac-sg.id
  ]
  */
  root_block_device {
    delete_on_termination = true
    // iops = 150 // error collecting instance settings: error creating resource: iops attribute not supported for root_block_device with volume_type gp2
    volume_size = 50
    volume_type = "gp2"
  }
  // what's up with tags huhhh?
  /*
  tags = {
    Name ="SERVER01"
    Environment = "DEV"
    OS = "UBUNTU"
    Managed = "IAC"
  }
  */

  // depends_on = [ aws_security_group.project-iac-sg ]
}


/*
output "ec2instance" {
  value = aws_instance.project-iac.public_ip
}
*/
