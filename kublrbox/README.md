# Usage

1. Get your project name and create your keys in "**_My credentials_**" menu.
   Also [create your key pair](https://support.hc.sbercloud.ru/en-us/usermanual/ecs/en-us_topic_0014250631.html) to
   access servers.
2. Create necessary
   [env variables](https://registry.terraform.io/providers/sbercloud-terraform/sbercloud/latest/docs#environment-variables):

```shell
$ export SBC_ACCESS_KEY="access-key"
$ export SBC_SECRET_KEY="secret-key"
$ export SBC_PROJECT_NAME="project-name"
$ export SBC_REGION_NAME="ru-moscow-1"
```

3. Change **variables.auto.tfvars** and **_script.sh_** according to your needs. Then do:

```shell
$ terraform init
$ terraform validate
$ terraform apply
```

4. By default, this will create 1 Ubuntu ecs and run kublrbox on it. Use _nat-eip:9080_ to access kublrbox in your browser. Default
   credentials: admin, kublrbox. To access ecs use

```shell
$ ssh -i your_key.pem root@nat_eip
```

5. Revert changes:

```shell
$ terraform destroy
```

NOTE: Without _Listener_ in ELB you won't be able to connect to instance because it won't enable
_Direct connect_ for that VPC. To connect without Listener you need to choose _VPC_ scenario in DNAT rule settings, but
you can't do that in sbercloud-terraform, because it chooses _Direct Connect_ by default with no way to change it.
See [issue](https://github.com/sbercloud-terraform/terraform-provider-sbercloud/issues/74).