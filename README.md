# Руководство по запуску и редактированию проекта

Этот документ содержит инструкции по запуску и настройке проекта,
который использует Docker, Docker Compose и Ansible для развертывания и управления
 NTP сервером с использованием Chrony.

## Предварительные требования

1. **Docker**: Убедитесь, что Docker установлен на вашем компьютере. Следуйте инструкциям на [официальном сайте Docker](https://docs.docker.com/get-docker/).
2. **Docker Compose**: Docker Compose должен быть установлен. Он обычно поставляется вместе с Docker.
3. **Ansible**: Установите Ansible, следуя инструкциям на [официальном сайте Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).

## Запуск проекта

### Запуск с использованием Docker Compose

**Клонируйте репозиторий**:
```
git clone https://github.com/komore1616/ntp.git
cd ntp
```
**Запустите сервисы**:
Выполните команду для запуска всех сервисов, определенных в docker-compose.yml:
```
docker-compose up -d
```
Эта команда запустит NTP сервер и клиент в фоновом режиме.

**Настройка с использованием Ansible**

Редактируйте переменные:
Откройте файл setup_ntp.yml и измените переменные в соответствии с вашими потребностями. Например, вы можете изменить путь к конфигурационному файлу Chrony или имя сервиса.

**Запустите Ansible Playbook**:
Выполните команду для запуска Ansible Playbook:
```
ansible-playbook -i inventory.yaml setup_ntp.yml
```
Убедитесь, что файл inventory содержит правильные IP-адреса или имена хостов, на которых будет выполняться настройка.

## Редактирование переменных
### Редактирование конфигурации Chrony

**Откройте файл chrony.conf**:
Найдите файл chrony.conf в директории проекта.
Отредактируйте его в соответствии с вашими требованиями, добавив или изменив серверы NTP.

**Перезапустите контейнеры**:
После внесения изменений в конфигурацию перезапустите контейнеры:
```
docker-compose down
docker-compose up -d
```
## Дополнительные команды
Просмотр логов: Чтобы просмотреть логи контейнеров, используйте команду:
```
docker-compose logs -f
```
Остановка контейнеров: Чтобы остановить и удалить контейнеры, используйте команду:
```
docker-compose down
```
