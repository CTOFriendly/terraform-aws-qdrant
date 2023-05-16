## Qdrant Terraform Module

Terraform module to deploy QDrant vector DB on EC2 AWS. For development usage only(for now).

## Usage

Make sure you have Terraform installed and configured with AWS credentials.

Create a `main.tf` file with the following content:

```terraform
module "qdrant" {
  source = "github.com/ctofriendly/qdrant-terraform"

  region      = "ap-south-1"
  instance_type = "t4g.micro"
  key_name    = "qdrant-key"
  disk_size   = 30
}
```

Then run the following commands:

```bash
terraform init
terraform apply
```

This creates an EC2 instance with Qdrant installed and running. The instance is accessible via SSH using the generated key pair which is saved in the current directory as `qdrant-key.pem`.

You can then forward the Qdrant port to your local machine via following command:

```bash
ssh -i qdrant-key.pem -L -N 6333:localhost:6333 ubuntu@$(terraform output qdrant_ip) &
```

And now you can access Qdrant on your local machine at `localhost:6333` !

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.66.1 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.bar](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_key_pair.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_route.public_internet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [local_file.private_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.example](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_ami.ubuntu_arm64](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Size of the root disk in GB | `number` | `30` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | AWS instance type to use for the Qdrant instance | `string` | `"t4g.micro"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Name of the AWS key pair which will be generated to use for the Qdrant instance | `string` | `"qdrant-key"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region in which to deploy the Qdrant instance | `string` | `"ap-south-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_key"></a> [private\_key](#output\_private\_key) | n/a |
| <a name="output_public_key"></a> [public\_key](#output\_public\_key) | n/a |
| <a name="output_qdrant_ip"></a> [qdrant\_ip](#output\_qdrant\_ip) | n/a |
