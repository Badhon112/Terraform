## First EC2 Creation

resource "aws_instance" "New" {
  ami               = var.ami
  instance_type     = var.instanceType
  availability_zone = var.azs
  tags = {
    Name = var.instanceName
  }
}


## Creation of EIP

resource "aws_eip" "lb" {
  domain   = "vpc"
  instance = aws_instance.New.id
}


## Data Sources

data "aws_instance" "New_Instance" {
  filter {
    name   = "tag:Name"
    values = [var.instanceName]
  }
  depends_on = [aws_instance.New]
}


## OutPut of that Instance

output "New_Instance_Output" {
  value = data.aws_instance.New_Instance
}

