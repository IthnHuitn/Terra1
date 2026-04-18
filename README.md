# Домашнее задание к занятию "`Использование Terraform в команде`" - `Ефимов Вячеслав`


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

```markdown
#### Результаты проверки Checkov для demonstration1

Checkov обнаружил 4 ошибки (Failed checks: 4) двух типов:

1. Использование branch вместо commit hash	CKV_TF_1	Модуль Terraform должен указывать конкретный commit hash, а не ветку	module "test-vm" (строка 23)
module "example-vm" (строка 46)
2. Использование branch вместо version tag	CKV_TF_2	Модуль Terraform должен использовать tag с версией, а не ветку	module "test-vm" (строка 23)
module "example-vm" (строка 46)

#### Результаты проверки tflint для demonstration1

TFLint обнаружил 5 ошибок (Warning: 5) трёх типов:

3.	terraform_module_pinned_source	TFLint	Модуль использует default branch (main) — нефиксированная версия
4.	terraform_required_providers	TFLint	У провайдеров (template, yandex) не указана версия в required_providers
5.	terraform_unused_declarations	TFLint	Переменная public_key объявлена, но нигде не используется

#### Результаты проверки Checkov для src

Checkov (0 типов ошибок)

#### Результаты проверки tflint для src

TFLint обнаружил 4 ошибки двух типов:
№	Тип ошибки	Суть
1.	terraform_required_providers	- У провайдера yandex не указана версия в required_providers
2.  terraform_unused_declarations	- Переменная vms_ssh_root_key объявлена, но не используется

#### Результаты проверки Checkov для passwords

Checkov (0 типов ошибок)

#### Результаты проверки tflint для passwords

TFLint (1 тип ошибки):

1. terraform_required_providers	- У провайдера random не указана версия в required_providers
```


---

### Задание 2

![terra2-1](https://github.com/IthnHuitn/Terra1/blob/terraform-05/files/screens/terra2-1.png)
![terra2-2](https://github.com/IthnHuitn/Terra1/blob/terraform-05/files/screens/terra2-2.png)
![terra2-3](https://github.com/IthnHuitn/Terra1/blob/terraform-05/files/screens/terra2-3.png)
![terra2-4](https://github.com/IthnHuitn/Terra1/blob/terraform-05/files/screens/terra2-4.png)
![terra2-5](https://github.com/IthnHuitn/Terra1/blob/terraform-05/files/screens/terra2-5.png)
![terra2-6](https://github.com/IthnHuitn/Terra1/blob/terraform-05/files/screens/terra2-6.png)


---

### Задание 3

![terra3-1](https://github.com/IthnHuitn/Terra1/blob/terraform-05/files/screens/terra3-1.png)

[Pull Request](https://github.com/IthnHuitn/Terra1/pull/1)

---

### Задание 4

![terra4-1](https://github.com/IthnHuitn/Terra1/blob/terraform-05/files/screens/terra4-1.png)
![terra4-2](https://github.com/IthnHuitn/Terra1/blob/terraform-05/files/screens/terra4-2.png)
![terra4-3](https://github.com/IthnHuitn/Terra1/blob/terraform-05/files/screens/terra4-3.png)

![validators.tf](https://github.com/IthnHuitn/Terra1/blob/terraform-05/files/z4/validators.tf)
