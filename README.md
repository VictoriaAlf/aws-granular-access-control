# AWS granular Access Control with Terraform

This repository provides an example implementation of granular access control using Terraform. It includes modules for managing permission sets and groups in AWS SSO, and an example for providing full S3 access to a group of users.

## Structure

- `modules/`: Contains the Terraform modules for permission sets and groups.
- `examples/`: Contains example Terraform configurations using the modules.
- `main.tf`: The main Terraform configuration file.
- `variables.tf`: Variables used in the Terraform configuration.

## Usage

To use this repository, ensure you have Terraform installed and configured with your AWS credentials. Then, run the following commands:

```bash
terraform init
terraform apply
