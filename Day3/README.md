## Providers:

- Terraform supports multiple providers.
- We must specific the provider details for which we want to launch the infrastructure for.
- With the provider, we also have to add the tokens which will be used for authentication.
- _Example_
  - AWS Access & Secret Keys

---

## Resources

- Resources are the reference to the individual services which the provider has to offer
- _Example_
  - resource "aws_iam_user"
  - resource "aws_instance"
  - resource "aws_s3_bucket"
  - resource "aws_db_instance"
  - resource "aws_vpc"

-> So if we changed on the existing file then no need to give terraform init just terraform plan. But if we create a new File then we need to add terraform init.

---

## First Ec2 instance

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

---

## State File

- Terraform stores the state of the inf.. that is being created from the TF
- This state allows terraform to map real-world resource to your existing configuration

## Current State vs Desired State

- When running a terraform plan, Terraform must know the current state of resources in order to effectively determine the changes that it needs to make to reach your desired configuration.
  - _Current State_ = Current Infrastructure Resources & Configuration
  - _Desired State_ = Infrastructure Configuration defined within the Terraform TF Files.
- Terraform will plan to match the desired state to the current state. If there is a difference between both, the desired state will take the preference.

## Attributes

- In terraform's configuration language: a named piece of data that belong to some kind of object. The value of an attribute can be referenced in expressions using a dot-separated notation,
- _E.X._
  - Like aws_instance.example.id
