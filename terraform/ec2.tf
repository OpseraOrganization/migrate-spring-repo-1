variable "awsRegion" {
  type        = string
  description = "prefix name"
  default     = "us-east-2"
}

variable "access_key" {
  type        = string
  description = "prefix name"
}

variable "secret_key" {
  type        = string
  description = "prefix name"
}



provider "aws" {
  region     = "${var.awsRegion}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}


variable "ami" {
  type        = string
  default     = "ami-01343ceb955942b1f"
}
variable "tag_name" {
  type        = string
  default     = "Opsera-terraform-hpe-poc"
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = "t3.micro"

  tags = {
    Name = var.tag_name
  }
}
output "hello_world" {
  value = "Hello, World Validation backendstate"
}
