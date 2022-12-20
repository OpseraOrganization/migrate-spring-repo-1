variable "platform_vpc_id" {
  type = string
}
variable "region" {
  type = string
}variable "access_key" {
  type = string
}variable "secret_key" {
  type = string
}

provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

data "aws_subnet_ids" "example" {
  vpc_id = var.platform_vpc_id
}

data "aws_subnet" "example" {
  for_each = data.aws_subnet_ids.example.ids
  id       = each.value
}

locals {
  availability_zone = tolist(toset([for s in data.aws_subnet.example : s.availability_zone]))
}

locals {
  subnet_ids_list = [for i in range(length(local.availability_zone)): [for s in data.aws_subnet.example: s.id if s.availability_zone == local.availability_zone[i]][0]]  
}

# resource "aws_ec2_transit_gateway_vpc_attachment" "plaform-attachment" {
#   subnet_ids         = local.subnet_ids_list
#   transit_gateway_id = "tgw-0d8334d10d7ebf471"
#   vpc_id             = "vpc-0ea4ddb307a38ed7b"
# }

output "subnet_ids_list" {
  value = local.subnet_ids_list
}
