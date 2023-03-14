![terraform](https://user-images.githubusercontent.com/57935226/191732988-96012e20-2cfc-463e-8644-dc93bb8300c6.jpg)


### Set AWS Credentials in Windows PowerShell:
```
$env:AWS_ACCESS_KEY_ID="xxxxxxxxxxxxxxxxx"
$env:AWS_SECRET_ACCESS_KEY="yyyyyyyyyyyyyyyyyyyyyyyyyyyy"
$env:AWS_DEFAULT_REGION="zzzzzzzzz"
```

### Set AWS Credentials in Linux Shell:
```
export AWS_ACCESS_KEY_ID="xxxxxxxxxxxxxxxxx"
export AWS_SECRET_ACCESS_KEY="yyyyyyyyyyyyyyyyyyyyyyyyyyyy"
export AWS_DEFAULT_REGION="zzzzzzzzz"
```

### Terraform Commands
```
terraform init
terraform plan
terraform apply
terraform destroy

terraform show
terraform output
terraform console
terraform import
terraform taint
```

### Terraform State Commands
```
terraform state show
terraform state list
terraform state pull
terraform state rm
terraform state mv
terraform state push
```
`for x in $(terraform state list | grep xyz); do terraform state mv -state-out=”terraform.tfstate”  $x $x; done`



### Terraform Workspace Commands
```
terraform workspace show
terraform workspace list
terraform workspace new
terraform workspace select
terraform workspace delete
```
`${terraform.workspace}`

### Commands List
```

terraform init - Initialize a terraform working directory. Example: terraform init
terraform plan - Generate and show an execution plan. Example: terraform plan -out=tfplan
terraform apply - Build or change infrastructure. Example: terraform apply tfplan
terraform destroy - Destroy Terraform-managed infrastructure. Example: terraform destroy
terraform output - Extract the value of an output variable from the state file. Example: terraform output example_output
terraform validate - Validate the syntax of Terraform files. Example:terraform validate`
terraform fmt - Format Terraform code. Example: terraform fmt
terraform import - Import existing infrastructure into Terraform. Example: terraform import aws_instance.example i-abcd1234
terraform workspace - Manage workspaces. Example: terraform workspace new dev
terraform state - Advanced state management. Example: terraform state list
terraform graph - Create a visual graph of Terraform resources. Example: terraform graph | dot -Tpng > graph.png
terraform taint - Manually mark a resource for recreation. Example: terraform taint aws_instance.example
terraform untaint - Remove the taint on a resource. Example: terraform untaint aws_instance.example
terraform version - Print Terraform version. Example: terraform version
terraform force-unlock - Release the lock on a state. Example: terraform force-unlock <LOCK_ID>
terraform providers - List the plugins for Terraform providers. Example: terraform providers
terraform provider - Show details about a particular provider. Example: terraform provider show aws
terraform debug - Debug Terraform resource operations. Example: terraform debug <RESOURCE_TYPE>.<RESOURCE_NAME>
terraform console - An interactive console for Terraform interpolations. Example: terraform console
terraform 0.12upgrade - Upgrade Terraform code from Terraform 0.11 to Terraform 0.12. Example: terraform 0.12upgrade
terraform providers schema - Generate a JSON schema for Terraform providers. Example: terraform providers schema -provider=aws > schema.json
terraform providers direction - Output the providers that terraform depends on. Example: terraform providers direction
terraform state mv - Move an item (resource) in the Terraform state. Example: terraform state mv aws_instance.example aws_instance.new_example
terraform state pull - Download and output the Terraform state data (Pull the Terraform state from a remote backend). Example: terraform state pull > state.tfstate
terraform state push - Upload a Terraform state file (Push the Terraform state to a remote backend). Example: terraform state push state.tfstate
terraform state rm - Remove an item (resource) from the Terraform state. Example: terraform state rm aws_instance.example
terraform state replace-providers - Replace the providers in the Terraform state. Example: terraform state replace-providers -from=provider.old -to=provider.new
terraform state show - Display a Terraform state file. Example: terraform state show aws_instance.example
terraform state taint - Taint a Terraform-managed resource. Example: terraform state taint aws_instance.example
terraform providers list - List the providers that are installed and available for use in Terraform. Example: terraform providers list
terraform state import - Import a state into Terraform. Example: terraform state import aws_instance.example i-abcd1234
terraform state list - List the resources in the Terraform state. Example: terraform state list
terraform state show - Show the details of a resource in the Terraform state. Example: terraform state show aws_instance.example
```
