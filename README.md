# Usage
1. Get your project name and create your keys in "**_My credentials_**" menu 
2. Create **_SBC_ACCESS_KEY_**, **_SBC_SECRET_KEY_**, **_SBC_PROJECT_NAME_**, **_SBC_REGION_NAME_** env variables
```shell
$ export SBC_ACCESS_KEY="access-key"
$ export SBC_SECRET_KEY="secret-key"
$ export SBC_PROJECT_NAME="project-name"
$ export SBC_REGION_NAME="ru-moscow-1"
```
3. Change **variables.auto.tfvars** and **_script.sh_**according to your needs
```shell
$ cd folder/
$ terraform init
$ terraform validate
$ terraform apply
```
4. Revert changes
```shell
$ terraform destroy
```

NOTE: Without _ELB_ you won't be able to connect to instance  because you need _VPC_ scenario in DNAT settings, but you can't do that in sbercloud terraform, because it chooses _Direct Connect_ by default. See [issue](https://github.com/sbercloud-terraform/terraform-provider-sbercloud/issues/74)