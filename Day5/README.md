## Taint

- Taint is another important feature in terraform : If we have multiple resources in the terraform scripting and if we want to delete the particular resource with out disturbing, then the taint will come into the picture.

- THe only difference we have in taint and destroy is destroy is it completes deletes all the resources and where taint does only for the specified resources.
- Taint means it destroy and create the particular resources that we changed. and destroy mean it will destroy all the resources.

---

Changed Something on aws console resources. Then to unTaint the Changed

```bash
# It will taint the resources
$ terraform taint aws_instance.new

# It will show the unchanged on the version of the resources
$ terraform plan

# It will undo the changed remove the old resources and then created the new resources
$ terraform apply --auto-approve

```

---

## Provisioners

- Provisioners can be used to model specific actions on the local machine or on a remote machine in order to prepare servers or other infrastructure object for service or other infrastructure objects for service.
- Provisioners are used to execute scripts on a local or remote machine as part of resources creation or destruction.

**Example**:

- On creating of web-Server, execute a script which installs Nginx web-server
- [Create EC2] ====> [Install Nginx]

- **Types of terraform Provisioners**
  - Terraform has the capability to turn provisioners both at the time of resource creation as well as destruction.
  - _There are three types of provisioners_
    - File provisioning
    - Local-exec provisioning
    - Remote-exec provisioning

- **File provisioning**
  - If we want to transfer the file from source to destination, then file provisioner is the correct option to use it

_Example_

```bash
resource "aws_instance" "new" {
  ami               = var.ami
  instance_type     = var.instanceType
  availability_zone = var.azs
  key_name          = "testServer"
  provisioner "file" {
    source      = "./text.txt"
    destination = "/home/ec2-user/text.txt"
  }
  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("./testServer.pem")
    timeout     = "4m"
  }
  tags = {
    Name = var.instanceName
  }
}
```

---

## Local Exec Provisioners

- Local-exec provisioners allows us to invoke a local executable after the resource is created.
- One of the most used approaches of local-exec is to run ansible-playbooks on the created server after the resource is created

**Example**

```bash
resource "aws_instance" "new" {
    provisioner "local-exec" {
        command = "echo ${aws_instance.web.ip} >> private_ips.txt"
    }
}
```

---

## Remote Exec Provisioners

- Remote-exec provisioners allow invoking scripts directly on the remote server.

**Example**

```bash
resource "aws_instance" "new" {
    provisioner "remote-exec" {
        inline = [
        "sudo yum install nginx -y",
        "sudo systemctl start nginx"
        ]
    }
}
```

---

## Using Terraform Data Sources

- Data sources allow Terraform use information defined outside of Terraform, defined by another separate Terraform configuration, or modified by functions

- In simple worlds we need to grab the information which is exists on the aws console end and then we have to use that info to the another piece of code.

```bash
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

```
