resource "aws_instance" "day5" {
  ami               = var.ami
  instance_type     = var.instanceType
  availability_zone = var.azs
  tags = {
    "Name" : var.instanceName
  }
}
