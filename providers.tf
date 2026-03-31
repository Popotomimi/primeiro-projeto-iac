terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.38.0"
    }
  }
  backend "s3" {
    bucket  = "rocketseat-state-bucket-tf-388839923933"
    region  = "us-west-2"
    key     = "terraform.tfstate"
    encrypt = true
    profile = "AdministratorAccess-388839923933"
  }

}

provider "aws" {
  region  = "us-west-2"
  profile = "AdministratorAccess-388839923933"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = var.state_bucket

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.bucket

  versioning_configuration {
    status = "Enabled"
  }

  depends_on = [aws_s3_bucket.terraform_state]
}