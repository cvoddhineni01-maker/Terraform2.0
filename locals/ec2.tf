resource "aws_instance" "instance_with_terraform_example" {
  ami                    = var.ami_id
  instance_type          = local.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]



  tags = {
    Name = var.ec2_tags["name"]
  }
}

resource "aws_security_group" "allow_all" {
  name = var.aws_security_group

  egress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "-1"
    cidr_blocks = var.var_cidr
  }

  ingress {
    from_port   = var.from_port
    to_port     = var.from_port
    protocol    = var.protocol
    cidr_blocks = var.var_cidr
  }
  tags = {
    Name = "allow_all"
  }
}
