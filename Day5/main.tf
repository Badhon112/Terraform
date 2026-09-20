# resource "aws_instance" "new" {
#   ami               = var.ami
#   instance_type     = var.instanceType
#   availability_zone = var.azs
#   tags = {
#     "Name" : var.instanceName
#   }
# }
# resource "aws_eip" "lb" {
#   domain   = "vpc"
#   instance = aws_instance.new.id
# }

## Creation of the file provisioner

# resource "aws_instance" "new" {
#   ami               = var.ami
#   instance_type     = var.instanceType
#   availability_zone = var.azs
#   key_name          = "testServer"
#   provisioner "file" {
#     source      = "./text.txt"
#     destination = "/home/ec2-user/text.txt"
#   }
#   connection {
#     type        = "ssh"
#     host        = self.public_ip
#     user        = "ec2-user"
#     private_key = file("./testServer.pem")
#     timeout     = "4m"
#   }
#   tags = {
#     Name = var.instanceName
#   }
# }

## Creation Local Exec Provisioners

# resource "aws_instance" "new" {
#   ami               = var.ami
#   instance_type     = var.instanceType
#   availability_zone = var.azs
#   key_name          = "testServer"

#   # Local Exec Provisioners
#   provisioner "local-exec" {
#     command = "echo ${aws_instance.web.ip} >> private_ips.txt"
#   }

#   connection {
#     type        = "ssh"
#     host        = self.public_ip
#     user        = "ec2-user"
#     private_key = file("./testServer.pem")
#     timeout     = "4m"
#   }
#   tags = {
#     Name = var.instanceName
#   }
# }

## Remote Exec Provisioners

# resource "aws_instance" "new" {
#   ami               = var.ami
#   instance_type     = var.instanceType
#   availability_zone = var.azs
#   key_name          = "testServer"

#   # Remote Exec Provisioners

#   provisioner "remote-exec" {
#     inline = [
#       "sudo yum install nginx -y",
#       "sudo systemctl start nginx"
#     ]
#   }

#   connection {
#     type        = "ssh"
#     host        = self.public_ip
#     user        = "ec2-user"
#     private_key = file("./testServer.pem")
#     timeout     = "4m"
#   }
#   tags = {
#     Name = var.instanceName
#   }
# }


# ==============================
# Creating of the data sources
# ==============================

resource "aws_instance" "New" {
  ami               = var.ami
  instance_type     = var.instanceType
  availability_zone = var.azs
  tags = {
    Name = var.instanceName
  }
}

# =====================
# == Creation of EIP ==
# =====================

resource "aws_eip" "lb" {
  domain   = "vpc"
  instance = aws_instance.New.id
}

# ==============================
# Creating of the data sources
# ==============================

data "aws_instance" "myAwsInstance" {
  # instance_id = ""

  filter {
    name   = "image-id"
    values = [var.ami]
  }

  filter {
    name   = "tag:Name"
    values = [var.instanceName]
  }
  depends_on = [aws_instance.New]
}

output "fetch_info_from_aws" {
  value = data.aws_instance.myAwsInstance
}
