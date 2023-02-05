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
  region = var.aws_region
  //skip_credentials_validation = true
}

resource "aws_instance" "jenkinsserver" {

  instance_type          = var.instance_type
  ami                    = var.aws_ami
  key_name               = var.key_name
  vpc_security_group_ids = ["${var.security_group_id}"]

  user_data = file("install_docker_jenkins.sh")

  tags = {
    Name        = "DevopsLabsJenkinsServer"
    description = "DevopsLabs dockerrised Jenkins Server"
  }
}

//aws_eip - provides an Elastic IP resource.
resource "aws_eip" "ip" {
  instance   = aws_instance.jenkinsserver.id
  depends_on = [aws_instance.jenkinsserver]
}
 