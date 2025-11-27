to be able to use the repo:

- first create an ssh token in your system, then upload it to digitalocean and name it

- then edit provider.tf ssh_key fields name according to the name 

- go to your digitalocean account->API and create a Personal Access Token (PAT)

- export your PAT with following

```bash
export DO_PAT="your-token-here"

- after that, use the following commands

```bash
terraform plan -var "do_token=${DO_PAT}" -var "pvt_key=$HOME/.ssh/id_rsa"
```
Note: if you are going to use -out parameter in terraform plan, you should encrypt!

```bash
terraform apply -var "do_token=${DO_PAT}" -var "pvt_key=$HOME/.ssh/id_rsa"
```

- you can see the public IP address of your droplet by using:

```bash
terraform show terraform.tfstate
```

