variable "ami" {
    default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "security_groups" {
  default = ["sg-08c93f3c6fe640a6b"]
}

variable "instances" {
  default = [
    "catalogue",
    "frontend",
    "mongodb"
  ]
}

variable "env" {
  default = "dev"
}