# Creating an Ec2 Instance

resource "aws_instance" "EC2" {
  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  tags = {
    Name = var.instance_name
  }
}


# Creating and Elastic IP for EC2

resource "aws_eip" "Ec2_Eip" {
  domain   = "vpc"
  instance = aws_instance.EC2.id
}
