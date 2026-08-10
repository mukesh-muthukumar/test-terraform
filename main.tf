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
  region = "ap-southeast-1"
  alias  = "sing"
}

resource "aws_vpc" "test-vpc-nv" {
  cidr_block = "10.0.0.0/16"
  count = 3
  provider   = aws.nv

  tags = {
    Name = "terraform-vpc-${count.index}"
  }
}

resource "aws_vpc" "test-vpc-sing" {
  cidr_block = "10.0.0.0/16"
  count = 3
  provider = aws.sing

tags = {
  Name = "terraform-vpc-${count.index}"
}
}