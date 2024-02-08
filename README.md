# cptalz-mgmt

## Add backend storage account
~~~bash
terraform init
terraform plan -out=tfplan202402080804
~~~


## Change Firewall SKU

### New branch

~~~bash
# show the current branch
git branch --show-current # should be main
# create branch to change fw sku
git branch init-infra
# switch to the new branch
git checkout init-infra
~~~

Modify the main.tf file to change the firewall sku to basic.

### Commit and Pull requewst via github cli

~~~bash
# get current git status
git status
# commit all your changes
git add .
git commit -am "Change fw sku in main.tf"
git push --set-upstream origin init-infra
gh pr create --title "init-infra" --body "init infrastructure" --base main
~~~

Approve the pull request and merge it via the web interface.

## Add a first landing zone

### New branch

Make sure you are on main and pull the lastest changes


~~~bash
git checkout main
git pull
# show the current branch
git branch --show-current # should be main
# create branch to change fw sku
git branch add-lz-1
# switch to the new branch
git checkout add-lz-1
~~~

Modify the main.tf file to change the firewall sku to basic.

### Commit and Pull requewst via github cli

~~~bash
# get current git status
git status
# commit all your changes
git add .
git commit -am "Change fw sku in main.tf"
git push --set-upstream origin change-fw-sku
gh pr create --title "change fw sku to basic" --body "Change the current az fw sku to basic and remove lock" --base main
~~~


## Create OnPremises Network Simulation
~~~bash
mkdir onprem
~~~

## Terraform format check

~~~powershell
terraform fmt -check
main.tf
terraform.tf
~~~

To files do not follow the standard Terraform language style conventions.
Align the files with the standard Terraform language style conventions by running `terraform fmt`.

~~~powershell
terraform fmt
main.tf
~~~

Validating the changes.

~~~powershell
terraform fmt -check

~~~
