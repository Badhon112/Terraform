## Count Parameter

- The count parameter on resources can simplify configurations and let you scale resources by simply incrementing a number
- Lets assume, you need to create two EC2 instances. One of the common approaches is to define two separate resource blocks for aws_instance.
- With the count parameter, we can simply specific the count value and the resource can be scaled accordingly

```bash
resource "aws_instance" "example" {
  ami               = "ami-098f18a6382fb4b2d"
  instance_type     = "t3.micro"
  count = 5

  tags = {
    Name = "HelloWorld"
  }
}
```

## Count Index

- In resource blocks where the count is set, an additional count object is available in expressions, so you can modify the configuration of each instance.
- This object has one attribute:
- _count.index_ -- The distinct index number (starting with 0) corresponding to this instance.

**Understanding Challenges with count parameter**

- With the below code, terraform will create 5 IAM users. But the problem is that all will the same name
- count.index allows us to fetch the index of each iteration in the loop

```bash
resource "aws_iam_user" "lb"{
    name = "load-balancer.${count.index}"
    count = 5
    path = "/system"
}
```

## Function

- Terraform Functions are useful, As per the documentation there are many functions but in real time, we are not using that great. Here are few that we are using in real world
- Maps & Lookup
- Elements
- Listsv
- Merge
- Length

### Elements Functions
