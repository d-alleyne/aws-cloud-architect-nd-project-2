# TODO: Designate a cloud provider, region, and credentials
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.23"
    }
  }
}
provider "aws" {
  region = var.aws_region
  profile = "projects"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2

resource "aws_instance" "four_t2_micro_instances" {
    ami = "ami-0a0ad6b70e61be944"
    instance_type = "t2.micro"
    count = 4
    subnet_id = aws_subnet.project2_public_subnet.id

    tags = {
      Name = "Udacity T2"
    }
}
# TODO: provision 2 m4.large EC2 instances named Udacity M4

resource "aws_instance" "two_m4_large_instances" {
    ami = "ami-0a0ad6b70e61be944"
    instance_type = "m4.large"
    count = 2
    subnet_id = aws_subnet.project2_public_subnet.id

    tags = {
      Name = "Udacity M4"
    }
}