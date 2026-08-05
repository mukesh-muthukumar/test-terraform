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

provider "aws" {
  region = "ap-south-1"
  alias  = "mumbai"
}

resource "aws_vpc" "test-vpc" {
  cidr_block = "10.0.0.0/16"
  provider   = aws.nv
}

resource "aws_vpc" "test-vpc-mumbai" {
  cidr_block = "10.0.0.0/16"
  provider   = aws.mumbai
}

