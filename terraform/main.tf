

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  metadata_options {
    http_tokens = var.metadata_tokens
  }

  root_block_device {
    encrypted   = var.ebs_encrypted
    volume_size = 8
  }

  tags = {
    Name      = "ATU-L00205535"
    Residency = "eu-west-1"
  }
}

resource "aws_security_group" "example" {
  name_prefix = "atu-sovereignty-"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
