# Terraform DevOps Learning Tutorial 

- Step1: Launch EC2 VM
- Step 2: Install Git & genrate key pair
- step 3: Add public key to Github
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
# Terraform installation on Amazon linux
```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform


```
#Terraform installation on UBUBNTU 20.04

```

apt-get install wget curl unzip software-properties-common gnupg2 -y
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get update -y
apt-get install terraform -y
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


