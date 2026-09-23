## Terraform import

- It might happen that there is a resource that is already created manually
- In such a case, any change you want to make to that resource must be done manually
- Terraform is able to import existing infrastructure. This allows you to take resources you've created by some other means and being it under Terraform management.
- The current implementation of terraform import can only import resources into the state. It does not generate configuration. A future version of terraform will also generate configuration.
- Because of this, prior to running terraform import it is necessary to write manually a resource configuration block for the resource, to which the imported object will be mapped.

- _Syntax_

```bash
# Terraform import command to import resource
$ terraform import <default resource>.<custom resource> <instance id>
$ terraform import aws_instance.ec2_example i-1234
```

## Enabling the log in terraform

- The main intention of the logging enabling is when ever if you run any terraform from command from local then we can view those logs by enabling the logs using the below commands.

---

## Dynamic Block

- Dynamic block can be used only for the specific situations let's take an example
- If we have multiple security group let say 5, so if we assign all at a time it works but it will be lengthy to avoid that dynamic block comes into the picture.




---

## Enabling the log in terraform

- THe main intention of the logging enabling is when ever if you run any terraform from command from local then we can view those logs by enabling the logs using the below commands.

export TF_LOG=TRACE
we can assign the path as well
i.e., export TF_LOG=TRACE TF_LOG_PATH=./<Anyname.log>

---

## For Logging

```bash
$ TF_LOG=TRACE terraform init
```
