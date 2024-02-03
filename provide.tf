terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"  # Specifies the source of the AWS provider. In this case, it's from HashiCorp, the organization that maintains Terraform.
      version = "~> 5.0"        # Sets the version constraint for the AWS provider. The "~> 5.0" notation means any version in the 5.x series that is compatible with version 5.0, but not version 6.0 or higher.
    }
  }
}

provider "aws" {
  region = var.aws_region  # Specifies the AWS region where resources will be provisioned. The actual region value is fetched from a variable `aws_region`.
}