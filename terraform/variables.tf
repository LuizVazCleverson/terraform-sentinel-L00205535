
variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "ami_id" {
  type    = string
  default = "ami-0123456789abcdef0"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "metadata_tokens" {
  type    = string
  default = "required"
}

variable "ebs_encrypted" {
  type    = bool
  default = true
}

variable "ssh_cidr" {
  type    = string
  default = "10.0.0.0/8"
}
