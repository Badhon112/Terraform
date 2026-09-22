## Terraform WorkSpace

- Terraform allows us to have multiple workspaces, with each of the workspaces we can have a different set of environment variables associated.
- The terraform workspace command is used to manage Workspace.
- This command is a container for further subcommands.
  - Usage : terraform workspace <subcommand> [options] [args]

```bash
# To check the list of workspace
$ terraform workspace list

# To create a new Workspace
$ terraform workspace new dev

# To check the list of workspace
$ terraform workspace list

# To check the current workspace
$ terraform workspace show

# To delete the workspace
$ terraform workspace
```

---

## Visualization Resources

```bash
# In Linux
$ yum install graphviz* -y
$ terraform graph | dot -Tsvg > graph.svg

```

---

## Remote State Backend

- In general, the tfstate file stores in the local and as a process we will be maintaining and storing the data in s3 bucket.
- It also stores the users who are trying to hit under progress of creation of resources.

### State File Locking

- Whenever you are performing a write operation, terraform world lock the state file
- This is very important as otherwise during your ongoing terraform apply operations, if others also try for the same, it would corrupt your state file.
- Example:
  - Person A is terminating the RDS resource which has associated rds.tfstate file
  - Person B has now tried resizing the same RDS resource at the same time.
- FOr the s3 backend, you can make use of the DynamoDb for state file locking functionality.

### Security Challenges in tfstate

- Remote state backup storing the tf state in the s3 bucket and lets take an example and show how the things will be going on.
