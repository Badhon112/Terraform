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

## Remote Backend
f