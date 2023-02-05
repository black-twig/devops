variable "aws_region" {
  description = "AWS Region to launch servers"
  default     = "us-east-1"
}

variable "aws_ami" {
  description = "AWS AMI to create instance"
  default     = "ami-0b93ce03dcbcb10f6"
}

variable "instance_type" {
  description = "Type of AWS EC2 instance."
  default     = "t2.micro"
}

variable "security_group_id" {
  description = "AWS security group id"
  default     = "sg-0072a256e3f15e5a4"
}

variable "key_name" {
  description = "AWS key name"
  default     = "OS_devops_labs_key"
}

variable "aws_ami_user_name" {
  description = "Default user name for the AWS AMI that used to launch instance"
  default     = "ubuntu"
}

