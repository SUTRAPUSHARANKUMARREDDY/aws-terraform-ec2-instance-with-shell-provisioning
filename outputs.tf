# Output block to display the public IP address of the created EC2 instance
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance."  # A brief description of the output. This helps users understand what the output represents.
  value       = aws_instance.eks_access_instance.public_ip  # The value attribute specifies what data will be outputted. Here, it's set to the public IP address of the EC2 instance identified by the name `eks_access_instance`.
}