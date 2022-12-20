variable "platform_vpc_id" {
  type = string
}

provider "aws" {
  region     = "us-east-2"
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

output "subnet_ids_list" {
  value = local.subnet_ids_list
}
