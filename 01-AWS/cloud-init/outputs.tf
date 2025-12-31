output "Instance_public_ip" {
  value = aws_instance.web_server.public_ip
  sensitive = true
}

output "ami_id" {
  value = data.aws_ami.amazon_linux_2.id
}

output "vpc_id" {
  value = aws_vpc.production_vpc.id
}

output "instance_id" {
  value = aws_instance.web_server.id
}