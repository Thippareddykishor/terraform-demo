resource "null_resource" "test" {
  for_each = var.x

    provisioner "local-exec" {
      command = "echo value of ${each.key} = ${each.value}"
    }
}

variable "x" {
  default = {
    x=200
    y=300
  }
}

