variable "ami" {
  default     = "ami-098f18a6382fb4b2d"
  description = "This is the Amazon Machine Instance of that EC2"
  type        = string
}

variable "instance_type" {
  default     = "t3.micro"
  description = "This is the Instance Type of that EC2"
  type        = string
}

variable "availability_zone" {
  default     = "ap-south-1a"
  description = "This is the Availability Zones of that Instance"
  type        = string
}

variable "instance_name" {
  default     = "Badhon"
  description = "This will be Name of the EC2 Instance"
  type        = string
}
