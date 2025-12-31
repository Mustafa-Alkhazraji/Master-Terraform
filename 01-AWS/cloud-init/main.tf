
### AWS vpc and Subnet Configuration
resource "aws_vpc" "production_vpc" {
  cidr_block = var.production_vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    Name = "production_vpc"
  }
}

resource "aws_subnet" "webapp_subnet" {
  vpc_id = aws_vpc.production_vpc.id
  cidr_block = var.webapp_subnet_cidr
  availability_zone = var.webapp_subnet_AZ
  map_public_ip_on_launch = true

  tags = {
    Name = "Web-Applications-Subnet"
  }
}

### security group & key details
resource "aws_security_group" "web_sg" {
  vpc_id = aws_vpc.production_vpc.id
  name = "web-applications-sg"
  description = "Allow HTTP inbound traffic"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.production_vpc.id

  tags = {
    Name = "production_igw"
  }
}


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.production_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  } 
}


resource "aws_route_table_association" "webapp_subnet_association" {
  subnet_id = aws_subnet.webapp_subnet.id
  route_table_id = aws_route_table.public_rt.id
}


### AWS EC2 Instance Configuration

## Fetch the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name = "architecture"
    values = ["x86_64"]
  }

  filter {
    name = "root-device-type"
    values = ["ebs"]
  }

}

### Launch EC2 Instance
resource "aws_instance" "web_server" {
  ami = data.aws_ami.amazon_linux_2.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.webapp_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  
  iam_instance_profile = aws_iam_instance_profile.ssm_instance_profile.name

  tags = {
    Name = "Web-Server-Instance"
  }
}
