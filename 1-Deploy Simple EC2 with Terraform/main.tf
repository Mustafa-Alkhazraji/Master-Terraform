data "aws_vpc" "default_vpc" {
  default = true
}


data "aws_subnets" "default_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default_vpc.id]
  }
}


resource "aws_default_security_group" "default_security_group" {
  vpc_id = data.aws_vpc.default_vpc.id


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  tags = {
    Name = "default-sg-ssm-only"
  }
}


data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  } 
}

resource "aws_instance" "my_ec2_instance" {
  ami           = data.aws_ami.amazon_linux_2.id

  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_default_security_group.default_security_group.id]
  subnet_id = data.aws_subnets.default_subnets.ids[0]
  iam_instance_profile = aws_iam_instance_profile.ssm_instance_profile.name

  tags = {
    Name = "My-EC2-Instance"
  }
}