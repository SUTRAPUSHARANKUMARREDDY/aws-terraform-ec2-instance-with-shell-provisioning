# Resource block for an AWS EC2 instance, which will be used for accessing or managing an AWS EKS cluster
resource "aws_instance" "eks_access_instance" {
  ami                    = var.ami_id  # AMI ID for the EC2 instance, specifying which operating system to use
  instance_type          = var.instance_type  # Type of the EC2 instance (e.g., t2.micro, m5.large), determining its compute and memory capacity
  subnet_id              = element(var.subnet_ids, 0)  # Assign the instance to the first subnet in the provided list of subnet IDs
  iam_instance_profile   = aws_iam_instance_profile.ec2_instance_profile.name  # IAM role for granting the instance necessary permissions
  key_name               = var.key_name  # SSH key pair name for secure shell access to the instance

  # Provisioners for configuring the EC2 instance after it's launched
  provisioner "file" {
    source      = "bashtest.sh"  # Source path of the file to transfer
    destination = "/tmp/bashtest.sh"  # Destination path on the instance
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bashtest.sh",  # Make the script executable
      "/tmp/bashtest.sh",           # Execute the script
    ]
  }

  # Connection block to specify how Terraform connects to the instance for provisioning
  connection {
    type        = "ssh"
    user        = "ubuntu"  # Default username for Ubuntu AMIs
    private_key = file(var.private_key_path)  # Private key for SSH access
    host        = self.public_ip  # Use the instance's public IP address for SSH connection
  }

  # Tags for the instance, useful for organization and identifying resources within AWS
  tags = {
    Name = "${var.cluster_name}"  # Tag the instance with the name of the EKS cluster for easy identification
  }
}