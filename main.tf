  terraform {
    required_version = "< 1.15.9"
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = ">= 3.0"
      }
    }
  }

  provider "aws" {
    region = "us-east-1"
    alias  = "nv"
  }

  resource "aws_vpc" "nv_vpc" {
    provider = aws.nv
    cidr_block = "11.0.0.0/16"
    tags = {
      Name = "nv_vpc"
    }
  }

  resource "aws_s3_bucket" "nv_s3_bucket" {
    provider = aws.nv
    bucket   = "nv-s3-bucket"
    depends_on = [
      aws_vpc.nv_vpc
      ]
    tags = {
      Name = "nv_s3_bucket"
    }
  }

resource "aws_bucket_acl" "nv_s3_bucket_acl" {
  provider = aws.nv
  bucket = aws_s3_bucket.nv_s3_bucket.id
  acl    = "private"
  depends_on = [
    aws_s3_bucket.nv_s3_bucket
  ]
}