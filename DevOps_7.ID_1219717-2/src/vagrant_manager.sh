#!/bin/bash

# Обновление списка пакетов
sudo apt-get update

# Установка пакетов, необходимых для добавления репозитория по HTTPS
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Добавление ключа GPG официального репозитория Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Добавление репозитория Docker в список доступных и обновление списка пакетов
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update

# Установка Docker
sudo apt-get install -y docker-ce

# Добавление текущего пользователя в группу docker, чтобы не использовать sudo для выполнения команд Docker
sudo usermod -aG docker $USER

if ! sudo docker info | grep -q "Swarm: active"; then
    sudo docker swarm init --advertise-addr 192.168.56.101
else
    echo "Swarm уже инициализирован"
fi


# Инициализация Docker Swarm с sudo (поскольку обновление групп ещё не применилось)
sudo docker swarm init --advertise-addr 192.168.56.101

# Сохраняем токен воркера от имени текущего пользователя
sudo docker swarm join-token -q worker > /vagrant/swarm_token.txt

echo "Docker и Swarm установлены и настроены. Токен для воркера сохранён в /vagrant/swarm_token.txt"

echo "Обратите внимание: чтобы запускать docker без sudo, выйдите из сессии и зайдите заново."