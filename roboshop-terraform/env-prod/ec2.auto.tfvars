instances = {
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

security_groups = ["sg-08c93f3c6fe640a6b"]

env="prod"