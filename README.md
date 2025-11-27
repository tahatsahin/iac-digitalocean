to be able to use the repo:

- first create an ssh token in your system, then upload it to digitalocean and name it

- then edit provider.tf ssh_key fields name according to the name 

- go to your digitalocean account->API and create a Personal Access Token (PAT)

Note: be sure that your personal access token has the privileges to create/destroy droplets/loadbalancers necessary read authorizations

- export your PAT with following

```bash
export DO_PAT="your-token-here"
```

- after that, use the following commands

```bash
terraform plan -var "do_token=${DO_PAT}" -var "pvt_key=$HOME/.ssh/id_rsa"
```
Note: if you are going to use -out parameter in terraform plan, you should encrypt!
Note: if you are not using -out parameter in terraform plan, do not change files after planing!

```bash
terraform apply -var "do_token=${DO_PAT}" -var "pvt_key=$HOME/.ssh/id_rsa"
```

- you can see the public IP address of your droplet by using:

```bash
terraform show terraform.tfstate
```

if you want to create multiple droplets, simply use the following command and plan+apply commands:

```bash
sed 's/www-1/www-2/g' www-1.tf > www-2.tf
```

you can destroy all created resources with:

```bash
terraform plan --destroy -out=terraform.tfplan -var "do_token=${DO_PAT}" -var "pvt_key=$HOME/.ssh/id_rsa"
```
```bash
terraform apply terraform.tfplan
```

if you want to configure your newly created droplets using ansible, take a look at: [configuration-management](https://www.github.com/tahatsahin/configuration-management)

Project-URL: https://roadmap.sh/projects/iac-digitalocean
