# Домашнее задание к занятию "`Управляющие конструкции в коде Terraform`" - `Ефимов Вячеслав`


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

![terra1-1](https://github.com/IthnHuitn/Terra1/blob/terraform-03/files/screens/terra1-1.png)
![terra1-2](https://github.com/IthnHuitn/Terra1/blob/terraform-03/files/screens/terra1-2.png)


---

### Задание 2

![terra2-1](https://github.com/IthnHuitn/Terra1/blob/terraform-03/files/screens/terra2-1.png)

 [count-vm.tf](https://github.com/IthnHuitn/Terra1/blob/terraform-03/count-vm.tf)
 [for_each-vm.tf](https://github.com/IthnHuitn/Terra1/blob/terraform-03/for_each-vm.tf)


---

### Задание 3

![terra3-1](https://github.com/IthnHuitn/Terra1/blob/terraform-03/files/screens/terra3-1.png)

 [disk_vm.tf](https://github.com/IthnHuitn/Terra1/blob/terraform-03/disk_vm.tf)


---

### Задание 4

![terra4-1](https://github.com/IthnHuitn/Terra1/blob/terraform-03/files/screens/terra4-1.png)

 [inventory.ini](https://github.com/IthnHuitn/Terra1/blob/terraform-03/files/inventory.ini)


---

### Задание 5

![terra5-1](https://github.com/IthnHuitn/Terra1/blob/terraform-03/files/screens/terra5-1.png)

 [outputs.tf](https://github.com/IthnHuitn/Terra1/blob/terraform-03/outputs.tf)


---

### Задание 7

![terra7-1](https://github.com/IthnHuitn/Terra1/blob/terraform-03/files/screens/terra7-1.png)


---

### Задание 8

`Ошибка 1 (критическая): Отсутствует закрывающая скобка } в интерполяции ansible_host=${i["network_interface"][0]["nat_ip_address"]`

`Ошибка 2: Лишний пробел в ключе ${i["platform_id "]} - правильно ${i["platform_id"]}`

`Ошибка 3: Лишняя тильда в начале интерполяций %{~ for i in webservers ~} и %{~ endfor ~}`

Исправленный вариант
```hcl
[webservers]
%{ for i in webservers ~}
${i["name"]} ansible_host=${i["network_interface"][0]["nat_ip_address"]} platform_id=${i["platform_id"]}
%{ endfor ~}
```


---

### Задание 9

![terra9-1](https://github.com/IthnHuitn/Terra1/blob/terraform-03/files/screens/terra9-1.png)
![terra9-2](https://github.com/IthnHuitn/Terra1/blob/terraform-03/files/screens/terra9-2.png)
![terra9-3](https://github.com/IthnHuitn/Terra1/blob/terraform-03/files/screens/terra9-3.png)
![terra9-4](https://github.com/IthnHuitn/Terra1/blob/terraform-03/files/screens/terra9-4.png)
