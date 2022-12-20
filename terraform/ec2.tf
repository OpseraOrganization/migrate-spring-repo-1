# stage/instance/main.tf
variable "ami_id" {
  type        = string
  description = "prefix name"
}

variable "tag_name" {
  type        = string
  description = "prefix name"
}


provider "aws" {
 # profile = "default"
  region  = "us-east-2"
}

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  subnet_id = subnet-02fe8cbeba1a754c7
  metadata_options {
    http_endpoint = disabled
  }

  tags = {
    Name = var.tag_name
  }
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}
