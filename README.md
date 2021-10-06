# Usage
1. Get your project name and create your keys in "_My credentials_" menu 
2. Create _SBC_ACCESS_KEY_, _SBC_SECRET_KEY_, _SBC_PROJECT_NAME_, _SBC_REGION_NAME_ env variables
```shell
$ export SBC_ACCESS_KEY="user-name"
$ export SBC_SECRET_KEY="password"
$ export SBC_PROJECT_NAME="project-name"
$ export SBC_REGION_NAME="ru-moscow-1"
```
3. Change settings in variables.auto.tfvars according to your needs
```shell
$ cd ubuntu-for-k8s/
$ terraform init
$ terraform validate
$ terraform vapply
```
4. Revert changes
```shell
$ terraform destroy
```