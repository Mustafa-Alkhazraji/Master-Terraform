resource "aws_security_group" "ec2_sg" {
  vpc_id      = aws_vpc.main.id
  # No ingress rules to restrict inbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-private-ec2-sg"
  }
}