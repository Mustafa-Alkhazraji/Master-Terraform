output "ec2_public_IP" {
  description = "ec2_public_IP"
  value       = aws_instance.my_ec2_instance.public_ip
  sensitive = true
}

output "ec2_instance_id" {
  description = "ec2_instance_id"
  value       = aws_instance.my_ec2_instance.id
}