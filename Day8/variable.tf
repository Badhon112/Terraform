variable "vpc_cidr_block" {
  default     = "10.0.0.0/16"
  description = "This is the CIDR Block of the VPC"
  type        = string
}

variable "public_subnet" {
  default     = "10.0.1.0/24"
  description = "This is the Public Subnet of that VPC"
  type        = string
}

variable "public_subnet_name" {
  default     = ""
  description = ""
  type        = string
}


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


