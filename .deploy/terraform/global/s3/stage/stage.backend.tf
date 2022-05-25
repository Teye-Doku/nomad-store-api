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
  bucket_name   = "courage-stage-state-bucket"
  dynamodb_name = "courage-stage-table-locks"
}

terraform {
   backend "s3" {
     bucket = "courage-stage-state-bucket"
     key = "global/s3/stage/terraform.state"
     region = "us-east-2"

     dynamodb_table = "courage-stage-table-locks"
     encrypt = true
   }
}