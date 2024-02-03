# Terraform AWS EC2 Instance Configuration

This repository contains Terraform scripts to launch an AWS EC2 instance and automatically execute a shell script on the instance during the provisioning process.

## Overview

The `main.tf` script is the main Terraform configuration file that creates an AWS EC2 instance. It uses a Bash script (`bashtest.sh`) to configure the instance after launch. The `provider.tf` file configures the AWS provider, and `variables.tf` defines necessary variables with default values. The `outputs.tf` script specifies the output to be displayed after the Terraform scripts are applied.

## Prerequisites

Before you begin, ensure you have the following prerequisites in place:

- An AWS account with the necessary permissions to manage EC2 instances, IAM roles, and key pairs.
- Terraform installed on your local machine.
- An existing SSH key pair registered in your AWS account.

## File Descriptions

- `provider.tf`: Configures the Terraform AWS provider with the required version.
- `main.tf`: Defines the AWS EC2 resource, including the instance details and provisioners for script execution.
- `variables.tf`: Declares variables for the Terraform configuration.
- `outputs.tf`: Contains the output configuration for displaying the EC2 instance's public IP.
- `bashtest.sh`: A shell script that will be uploaded to the EC2 instance and executed.

## Setup

1. Clone this repository to your local machine using Git commands or by downloading the contents directly.

2. Navigate into the directory containing the Terraform files.

3. Open the `variables.tf` file to set your desired default values for the AWS region, EC2 instance name, AMI ID, instance type, key name, and private key path.

4. Run the following command to initialize the Terraform workspace:

   ```shell
   terraform init
   ```

5. To see the actions Terraform will take when creating your resources, execute:

   ```shell
   terraform plan
   ```

6. Apply the Terraform configuration to launch the EC2 instance:

   ```shell
   terraform apply
   ```

   When prompted, confirm the action by typing `yes`.

7. After the script execution completes, Terraform will output the public IP of the EC2 instance.

## Connecting to Your Instance

Use the public IP from the outputs to connect to your EC2 instance via SSH:

```shell
ssh -i /path/to/your/private/key.pem ubuntu@<instance_public_ip>
```

Replace `/path/to/your/private/key.pem` with the actual path to your private key and `<instance_public_ip>` with the public IP output by Terraform.

## Customization

To customize the instance configuration, you can modify the default values in `variables.tf` according to your requirements.

## Clean Up

To destroy the resources and avoid further charges, run:

```shell
terraform destroy
```

## Notes

- Make sure that `bashtest.sh` is placed in the same directory as your Terraform files and is executable.
- Review and modify the `bashtest.sh` script according to your configuration tasks.

---

By following the instructions in this README, you will be able to launch an EC2 instance and perform initial setup tasks using Terraform automation.
```

Make sure to replace the placeholders with actual values where necessary. Save this content in a file named `README.md` in the root directory of your Terraform project.