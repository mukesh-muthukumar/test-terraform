resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}


resource "aws_instance" "example" {
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}
