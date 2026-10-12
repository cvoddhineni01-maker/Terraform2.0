variable "ami_id" {

  default = "ami-0220d79f3f480ecf5"

}




variable "instance_type" {

  default = "t3.micro"

}

variable "ec2_tags"{
    type = map(string)
    default = {
        name = "terraform_demo"
        Terraform = true
        Project = "Join Devops"
        Environment = "dev"
    }
}

variable "aws_security_group"{
    type = string
    default = "allow-all"
}

variable "var_cidr"{
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "from_port"{
    type = number
    default = 0
}

variable "to_port"{
    type = number
    default = 0
}


variable "protocol"{
    type = number
    default = -1
}
