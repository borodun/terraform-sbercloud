# Usage
1. Get your project name and create your keys in "**_My credentials_**" menu 
2. Create **_SBC_ACCESS_KEY_**, **_SBC_SECRET_KEY_**, **_SBC_PROJECT_NAME_**, **_SBC_REGION_NAME_** env variables
```shell
$ export SBC_ACCESS_KEY="access-key"
$ export SBC_SECRET_KEY="secret-key"
$ export SBC_PROJECT_NAME="project-name"
$ export SBC_REGION_NAME="ru-moscow-1"
```
3. You need to have "**Alt Server V 9.2**" private image in your IMS. [See how to make one](https://support.hc.sbercloud.ru/en-us/usermanual/ims/en-us_topic_0146464401.html)
4. Change **variables.auto.tfvars** and **_script.sh_**according to your needs
```shell
$ terraform init
$ terraform validate
$ terraform apply
```
This will create 3 Alt Linux ecs(1 master and 2 workers). To access master use:
```shell
$ ssh -i your_key.pem root@nat_eip
```
5. Revert changes
```shell
$ terraform destroy
```
NOTE: Without _Listener_ in ELB you won't be able to connect to instance because it won't enable _Direct connect_ for that VPC. To connect without Listener you need to choose _VPC_ scenario in DNAT rule settings, but you can't do that in sbercloud-terraform, because it chooses _Direct Connect_ by default with no way to change it. See [issue](https://github.com/sbercloud-terraform/terraform-provider-sbercloud/issues/74)