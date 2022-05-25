terraform {
   required_providers {
       aws = {
           source = "hashicorp/aws"
           version = "3.38"
       }
   }
   required_version = ">=0.15.3"
}
provider "aws" {
 region = "us-east-2"
}

module "backend_config" {
  source        = "../../../modules/backends/s3"
  bucket_name   = "courage-prod-state-bucket"
  dynamodb_name = "courage-prod-table-locks"
}

terraform {
   backend "s3" {
     bucket = "courage-prod-state-bucket"
     key = "global/s3/prod/terraform.state"
     region = "us-east-2"

     dynamodb_table = "courage-prod-table-locks"
     encrypt = true
   }
}