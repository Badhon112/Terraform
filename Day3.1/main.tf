## First EC2 Creation

resource "aws_instance" "New" {
  ami               = var.ami
  instance_type     = var.instancetype
  availability_zone = var.azs
  tags = {
    Name = var.name
  }
}

## Creation of EIP
resource "aws_eip" "lb" {
  domain   = "vpc"
  instance = aws_instance.New.id
}
