variable "ami" {
  description = "This is the Amazon Machine Instance of that EC2"
  default     = "ami-098f18a6382fb4b2d"
  type        = string
}
variable "instanceType" {
  description = "This is the Instance Type of that EC2"
  default     = "t3.micro"
  type        = string
}
variable "azs" {
  description = "This is the Availability Zones of that Instance"
  default     = "ap-south-1a"
  type        = string
}
variable "countNumber" {
  description = "Number of EC2 Instance we want"
  default     = 3
  type        = number
}

# Creating of first Count and Count.index parameter
# variable "instanceName" {
#   description = "This will be Name of the EC2 Instance"
#   default     = "Badhon"
#   type        = string
# }


# Creating of List Count and Count.index parameter
variable "instanceName" {
  description = "This will be Name of the EC2 Instance"
  default     = ["Badhon", "Kumar", "Biswas"]
  type        = list(string)
}

variable "tags" {
  description = "This is all About Tag"
  type        = map(string)
  default = {
    "Environment" = "Deployment"
    "Project"     = "MyProject"
    "Owner"       = "Badhon"
  }
}
