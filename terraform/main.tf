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
# CloudFront Origin Access Control
# Allows CloudFront to access the private S3 bucket securely.
resource "aws_cloudfront_origin_access_control" "website" {
  name                              = "${var.project_name}-oac"
  description                       = "Secure access to the CloudGuard S3 origin"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

# CloudFront distribution for HTTPS website delivery.
resource "aws_cloudfront_distribution" "website" {
  enabled             = true
  default_root_object = "index.html"
  comment             = "CloudGuard secure website distribution"

  origin {
    domain_name              = aws_s3_bucket.website.bucket_regional_domain_name
    origin_id                = "cloudguard-s3-origin"
    origin_access_control_id = aws_cloudfront_origin_access_control.website.id
  }

  default_cache_behavior {
    target_origin_id       = "cloudguard-s3-origin"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags = {
    Project = "CloudGuard"
  }
}

# Permit reads only through the intended CloudFront distribution.
resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowCloudFrontReadOnly"
        Effect    = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.website.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.website.arn
          }
        }
      }
    ]
  })
}
