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
  lifecycle {
    create_before_destroy = true
  }
}