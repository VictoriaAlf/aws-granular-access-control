provider "aws" {
  region = var.aws_region
}

# Include modules and examples here
module "s3_full_access" {
  source = "./examples/s3_full_access.tf"
}
