provider "local" {}

resource "local_file" "foo" {
    content = "Hello world"
    filename = "foo.bar"
}

variable "x" {
  default = 10
}

output "x" {
  value = var.x
}

output "x1" {
  value = "Value of x- ${var.x}"
}

variable "y" {
  default = [1, "abc", 0.3, false]
}

output "y1" {
  value = var.y[0]
}

variable "z" {
  default = {
    name= "john"
    age=20
  }
}

output "z" {
  value = "Name - ${var.z["name"]},Age - ${var.z.age} "
}

variable "input" {}
output "input" {
  value = var.input
}