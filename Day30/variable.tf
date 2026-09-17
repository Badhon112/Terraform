variable "ami" {
  description = "This is the Ami of that Instance"
  default     = "ami-098f18a6382fb4b2d"
  type        = string
}
variable "instancetype" {
  description = "This is the RAM of that Instance"
  default     = "t3.micro"
  type        = string
}
variable "azs" {
  description = "This is the Zones of that Instance"
  default     = "ap-south-1a"
  type        = string
}
variable "name" {
  description = "This is the Name of that Instance"
  default     = "HelloWorld"
  type        = string
}
