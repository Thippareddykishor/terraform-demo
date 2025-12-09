# variable "ami" {
#     default = "ami-09c813fb71547fc4f"
# }

# variable "instance_type" {
#   default = "t3.micro"
# }

variable "security_groups" {
  default = ["sg-08c93f3c6fe640a6b"]
}

variable "instances" {
  default = {
    mongodb =   {
      ami_id= "ami-09c813fb71547fc4f"
      instance_type= "t3.micro"
    }
    catalogue = {
      ami_id= "ami-09c813fb71547fc4f"
      instance_type = "t3.micro"
    }
    frontend =  {
      ami_id= "ami-09c813fb71547fc4f"
      instance_type ="t3.micro"
    }
  }

  
}

variable "env" {
  default = "dev"
}