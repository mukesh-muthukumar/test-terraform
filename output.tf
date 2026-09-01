output "key_name" {
  value = aws_instance.example[*].associate_public_ip_address
}