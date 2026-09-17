## Creating of first Count and Count.index parameter

# resource "aws_instance" "firstCount" {
#   ami               = var.ami
#   instance_type     = var.instanceType
#   availability_zone = var.azs
#   count             = var.countNumber
#   tags = {
#     Name = "${var.instanceName}-${count.index}"
#   }
# }



## Creating of first Elements Functions 

# resource "aws_instance" "firstCount" {
#   ami               = var.ami
#   instance_type     = var.instanceType
#   availability_zone = var.azs
#   count             = var.countNumber
#   tags = {
#     # Name = "${var.instanceName}-${count.index}"
#     Name = element(var.instanceName, count.index)
#   }
# }


## Merge Function For Tags

# resource "aws_instance" "firstCount" {
#   ami               = var.ami
#   instance_type     = var.instanceType
#   availability_zone = var.azs
#   count             = var.countNumber
#   tags = merge(
#     {
#       Name = element(var.instanceName, count.index)
#     },
#     var.tags
#   )
# }


## Map and Looking Functions
