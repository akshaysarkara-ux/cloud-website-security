terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region for the proposed CloudGuard deployment"
  type        = string
  default     = "eu-west-1"
}

variable "project_name" {
  description = "Name used to identify CloudGuard resources"
  type        = string
  default     = "cloudguard"
}

# Proposed private storage for the website.
# This resource is not created unless Terraform is applied.
resource "aws_s3_bucket" "website" {
  bucket = "${var.project_name}-website-akshay27x9"

  tags = {
    Project     = "CloudGuard"
    Environment = "Learning"
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
