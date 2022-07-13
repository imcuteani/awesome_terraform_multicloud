terraform {
    backend "s3" {
      bucket = "techademy"
      key = "terraform"
      region = "us-east-1"
      encrypt = true
      dynamodb_table = "techademy"
    }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.74"
    }
  }
}

provider "aws" {
   endpoints {
    s3 = "https://s3.us-east-1.amazonaws.com"
  } 
  region                  = "us-east-1"
  skip_region_validation  = true
  skip_credentials_validation = true
  skip_metadata_api_check = true
  skip_requesting_account_id = true
  profile                 = "default"
  shared_credentials_file = "[~/.aws/credentials]"


}