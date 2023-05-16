resource "local_file" "private_key" {
    content  = tls_private_key.example.private_key_pem
    filename = "private_key.pem"
    file_permission = "0600"
}

output "private_key" {
  value = tls_private_key.example.private_key_pem
  sensitive = true
}

output "public_key" {
  value = tls_private_key.example.public_key_openssh
}

output "qdrant_ip" {
  value =  aws_eip.bar.public_ip
}