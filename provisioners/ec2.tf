resource "aws_instance" "instance_with_terraform_example" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]



  tags = {
    Name = var.ec2_tags["name"]
  }

  provisioner "local-exec"{
    command = "echo ${self.private_ip} > inventory"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"                 # Default user for Ubuntu AMIs
    password    = "DevOps321"
    host        = self.public_ip      #dhhddh     # Uses 'self' to avoid dependency cycles
  }

  provisioner "remote-exec" {
    inline = [
    "sudo dnf install -y nginx",
    "sudo systemctl start nginx"
    ]
  }

    provisioner "remote-exec" {
    inline = [
    "sudo systemctl stop nginx",
    "echo 'Destroyd ec2 server'"]
    when = destroy
    
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
