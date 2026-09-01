  locals {
    instance_type = var.instance_type
  }

resource "aws_instance" "example" {
  ami           = "ami-00e42372e0f0bcdaf"
  instance_type = local.instance_type
  subnet_id     = "subnet-0cc8a8de044439081"
  provider      = aws.nv
  count         = var.instance_count

  tags = {
    Name = "example-instance-${count.index + 1}"
  }
}