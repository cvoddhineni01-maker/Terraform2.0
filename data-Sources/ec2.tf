resource "aws_instance" "instance_with_terraform_example" {
 // count = 4
 for_each = toset(var.instances)
  ami                    = data.aws_ami.instance_with_terraform_example.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all_details.id]



   tags = {
    Name = each.value 
  } 
}

resource "aws_security_group" "allow_all_details" {
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
