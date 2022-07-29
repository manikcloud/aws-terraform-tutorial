## Terraform DevOps Learning Tutorial 

# Objective: To create a Code Commit repo with help of terraform code. 

## Pre-requisit
- Step 1: Launch EC2 VM
- Step 2: Install Git & genrate key pair
- Step 3: Add public key to Github
- Step 4: Pull the Repo git@github.com:manikcloud/aws-terraform-tutorial.git

```
yum update -y
yum install git
ssh-keygen
cat ~/.ssh/id_rsa.pub

mkdir devops
cd devops/
git clone git@github.com:manikcloud/aws-terraform-tutorial.git

cd aws-terraform-tutorial/

ls -a
```
# Terraform installation 
```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform


```
# The file provisioner
```
vim  main.tf
terraform init
terraform plan
terraform apply

```

# References:
- 1. https://learn.hashicorp.com/tutorials/terraform/install-cli
- 2. https://www.terraform.io/language/resources/provisioners/syntax
- 3. https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file


