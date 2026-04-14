<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.14.0 |
| <a name="requirement_template"></a> [template](#requirement\_template) | 2.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_template"></a> [template](#provider\_template) | 2.0.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_analytics-vm"></a> [analytics-vm](#module\_analytics-vm) | ../yandex_compute_instance | n/a |
| <a name="module_marketing-vm"></a> [marketing-vm](#module\_marketing-vm) | ../yandex_compute_instance | n/a |
| <a name="module_vpc_analytics"></a> [vpc\_analytics](#module\_vpc\_analytics) | ./vpc | n/a |
| <a name="module_vpc_marketing"></a> [vpc\_marketing](#module\_vpc\_marketing) | ./vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [template_file.cloudinit](https://registry.terraform.io/providers/hashicorp/template/2.0.0/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | n/a | `string` | `"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEZNnbfrn7DyGYp0QdzeW7vaAC0H5OZMLKe1a2V//KYyqRoHaA92nHvx2rwDf4rJQZ2H0VzpYK6eVP4IhatXYu0p3W42lFkX9ESWOGdGWGNvSSaFx59qB2BKoe4y1Kpuwmc9ZTU3opwymXi0K8BCej7vsSRMFJy9QspETk3DaMLDZBf5x5rhKuFXyhBVzTsunjMEwA1/HkYYXM4ndJXY4G7T6We+afYR4NAb4zyjagTLGG1XAkORrJTvhfnZ99nBuygYwMxrab/SD36TuVO1CGn09Kmio8EeNB3v3uK+AboLQgE8XF79SB9JNyBe4oE5Wtraek8MvJoHBWxn+eglg9"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_analytics_vm_internal_ip"></a> [analytics\_vm\_internal\_ip](#output\_analytics\_vm\_internal\_ip) | Internal IP address of analytics VM |
| <a name="output_analytics_vm_ip"></a> [analytics\_vm\_ip](#output\_analytics\_vm\_ip) | External IP address of analytics VM |
| <a name="output_marketing_vm_internal_ip"></a> [marketing\_vm\_internal\_ip](#output\_marketing\_vm\_internal\_ip) | Internal IP address of marketing VM |
| <a name="output_marketing_vm_ip"></a> [marketing\_vm\_ip](#output\_marketing\_vm\_ip) | External IP address of marketing VM |
| <a name="output_out"></a> [out](#output\_out) | n/a |
| <a name="output_vpc_analytics_info"></a> [vpc\_analytics\_info](#output\_vpc\_analytics\_info) | Analytics VPC information |
| <a name="output_vpc_marketing_info"></a> [vpc\_marketing\_info](#output\_vpc\_marketing\_info) | Marketing VPC information |
<!-- END_TF_DOCS -->