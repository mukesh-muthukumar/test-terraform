variable "instance_type" {
    description = "The type of instance to create"
    type        = string
    default     = "t2.micro"
  }

  variable "instance_count" {
    description = "The number of instances to create"
    type        = number
  }