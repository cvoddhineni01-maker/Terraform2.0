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
    default = "allow_all_details"
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

variable "environement"{
    type = string
    default = "dev"
}

variable "instances"{
  //  default = ["mongodb", "reddis", "mysql","rabbitmq", "catalogue", "user", "cart", "shipping", "payment", "frontend"]
    default = {
        mongodb = "t3.micro"
        reddis = "t2.micro"
    }
}

variable "domain_name"{
    default = "devops.playground.fun"
}

variable "zone_id"{
    default = "Z05660673G75FK1II7TFX"
}