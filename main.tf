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

resource "aws_instance" "test-terraform" {  
  ami           = "ami-0227b667694b00c72"
  instance_type = each.value
  provider = aws.nv
  for_each = {
    dev = "t2.micro"
    prod = "t2.large"
  }

tags = {
  Name = "terraform-vpc-$each.key-${each.value}"
}
}

