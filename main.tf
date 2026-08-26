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

  resource "aws_instance" "example" {
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type = "var.instance_type"
    provider      = aws.nv
  }