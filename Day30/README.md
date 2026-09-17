- _Single File Concept_ : It is straight forward that it does not have many tf files it has only one tf file and we must put all the content init.

_Example_

```bash
resource "aws_instance" "example" {
  ami               = "ami-098f18a6382fb4b2d"
  instance_type     = "t3.micro"
  availability_zone = "ap-south-1a"

  tags = {
    Name = "HelloWorld"
  }
}
```

- _Main File Concept_ : In this it has 3 files i.e., main.tf, variable.tf, terraform.tfvars and all the resources that we can put it in one file with verbalizing.

- _Static = Work_
  - Repeated static variables can create more work on the future.

- _Variables are good_
  - Terraform Variables allows us to centrally define the values that can be used in multiple terraform configuration blocks

---

_Multiple Approached to variables Assignments_

- Variables in Terraform can be assigned values in multiple ways

- **Some of these include**:
  - _Environment variables_
    - export TF_VAR_instancetype = "t2.nano"
  - _Command Line Flags_
    - terraform plan -var="instancetype=t2.small"
  - _From a File_
    - terraform.tfvars
  - _Custom File_
    - terraform apply --var-file="custom.tfvars"
  - _Variable Defaults_
    - variable.tf

- _Environment Variables_
  - Environment variables can be used to set variables. The environment variables must be in the format TF_VAR_name and this will be checked last for a value

- _Syntax_:
  - Export key = "Value"
  - _For Example_
    - export TF_VAR_instancetype = "t2.nano"
    - echo $TF_VAR

```bash
resource "aws_instance" "New" {
  ami               = var.ami
  instance_type     = var.instancetype
  availability_zone = var.azs
  tags = {
    Name = var.name
  }
}

$ export TF_VAR_ami="ami-098f18a6382fb4b2d"
$ export TF_VAR_instancetype="t3.micro"
$ export TF_VAR_azs="ap-south-1a"
$ export TF_VAR_name="HelloWorld"
```

---

### Command Line Flags

- To specific individual variables on the command line, use the -var option when running the terraform plan and terraform apply commands:
- Example:
  - terraform plan -var="instancetype=t2.small"

### Constraints

- The type argument in a variable block allows you to restrict the type of value that will be accepted as the value for a variable
- If no type constraint is set then a value of any type is accepted.

```bash
variable "image_id"{
  type = string
}
---
variable "ami" {
  description = "This is the Ami of that Instance"
  default     = "ami-098f18a6382fb4b2d"
  type        = string
}
```

### Overview of Data Types

| Type Keywords | Description                |
| ------------- | -------------------------- |
| Number        | 5000                       |
| String        | "BADHON"                   |
| List          | ["Badhon","Biswas"]        |
| map           | {name="badhon","age="123"} |

---

## Output values

- An outputed attributed can not only be used for the user reference but it can also act as an input to other resources being created via terraform
- Let's understand this with an example:
- After EIP gets created, it's IP address should automatically get whitelisted in the security group
