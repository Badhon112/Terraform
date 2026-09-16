resource "aws_instance" "example" {
  ami               = "ami-098f18a6382fb4b2d"
  instance_type     = "t3.micro"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "HelloWorld"
  }
}

output "Badhon" {
  value       = aws_instance.example.id
  description = "Using the output of instance id"
}
