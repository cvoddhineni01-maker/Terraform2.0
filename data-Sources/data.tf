data "aws_ami" "instance_with_terraform_example" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

}

  output "ami_id"{
    value = data.aws_ami.instance_with_terraform_example.id
  }

