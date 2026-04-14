# Домашнее задание к занятию "`Продвинутые методы работы с Terraform`" - `Ефимов Вячеслав`


### Инструкция по выполнению домашнего задания

   1. Сделайте `fork` данного репозитория к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/git-hw или  https://github.com/имя-вашего-репозитория/7-1-ansible-hw).
   2. Выполните клонирование данного репозитория к себе на ПК с помощью команды `git clone`.
   3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
      - впишите вверху название занятия и вашу фамилию и имя
      - в каждом задании добавьте решение в требуемом виде (текст/код/скриншоты/ссылка)
      - для корректного добавления скриншотов воспользуйтесь [инструкцией "Как вставить скриншот в шаблон с решением](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md)
      - при оформлении используйте возможности языка разметки md (коротко об этом можно посмотреть в [инструкции  по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md))
   4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`);
   5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
   6. Любые вопросы по выполнению заданий спрашивайте в чате учебной группы и/или в разделе “Вопросы по заданию” в личном кабинете.
   
Желаем успехов в выполнении домашнего задания!
   
### Дополнительные материалы, которые могут быть полезны для выполнения задания

1. [Руководство по оформлению Markdown файлов](https://gist.github.com/Jekins/2bf2d0638163f1294637#Code)

---

### Задание 1

![terra1-1](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra1-1.png)
![terra1-2](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra1-2.png)
![terra1-3](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra1-3.png)
![terra1-4](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra1-4.png)
[code1](https://github.com/IthnHuitn/Terra1/tree/terraform-04/files/z1/)


---

### Задание 2

![terra2-1](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra2-1.png)
![terra2-2](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra2-2.png)
[code2](https://github.com/IthnHuitn/Terra1/tree/terraform-04/files/z2/)

####README.md
```markdown
<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.network](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.subnet](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | CIDR block for subnet | `string` | n/a | yes |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | Environment name for VPC network | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Yandex Cloud availability zone | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | ID of created VPC network |
| <a name="output_subnet_cidr"></a> [subnet\_cidr](#output\_subnet\_cidr) | CIDR block of created subnet |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | ID of created subnet |
| <a name="output_subnet_zone"></a> [subnet\_zone](#output\_subnet\_zone) | Zone of created subnet |
<!-- END_TF_DOCS -->
```
---

### Задание 3

![terra3-1](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra3-1.png)
![terra3-2](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra3-2.png)
![terra3-3](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra3-3.png)
![terra3-4](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra3-4.png)
![terra3-5](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra3-5.png)


---

### Задание 4

![terra4-1](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra4-1.png)
![terra4-2](https://github.com/IthnHuitn/Terra1/blob/terraform-04/files/screens/terra4-2.png)
[code4](https://github.com/IthnHuitn/Terra1/tree/terraform-04/files/z4/)


---

### Задание 5
