terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-08fdec01f5df9998f"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-0072a256e3f15e5a4"]
  key_name               = "OS_devops_labs_key"


  tags = {
    Name = "ExampleAppServerInstance"
  }
}
