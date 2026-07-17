resource "aws_s3_bucket" "testmukeshmuthu" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "test-tf"
    Environment = "Dev"
  }
}


resource "aws_instance" "example" {
  ami           = "ami-02fc2ed964fe7933b"
  instance_type = "t3.micro"

  subnet_id = "subnet-058eac748622c7497"

  tags = {
    Name = "HelloWorld"
  }
}
