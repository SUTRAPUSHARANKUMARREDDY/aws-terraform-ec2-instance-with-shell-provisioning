# Define the AWS region where resources will be created
variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

# Define the name for the EC2 instance
variable "instance_name" {
  description = "Name of the EC2 Instance"
  default     = "My Instance"
}

# Define the subnet ID where the EC2 instance will be launched
variable "subnet_ids" {
  description = "Subnet ID for the Instance"
  type        = string
  default     = "subnet-0fbd1677d8c4ec715"
}

# Define the AMI ID to use for the EC2 instance
variable "ami_id" {
  description = "The ID of the AMI to use for the instance."
  type        = string
  default     = "ami-0fc5d935ebf8bc3bc"
}

# Define the instance type for the EC2 instance
variable "instance_type" {
  description = "The instance type for the EC2 instance"
  default     = "t2.micro"
}

# Define the key name of the SSH key pair to attach to the EC2 instance
variable "key_name" {
  description = "The key name of the SSH key pair to attach to the instance"
  default     = "ekstest"
}

# Define the path to the private key file used for SSH access to the instance
variable "private_key_path" {
  description = "The path to the private key file used for SSH access"
  default     = "/home/sharan/Documents/Keys/ekstest.pem"
}