#!/bin/bash

# Получение последней версии Dockle
VERSION=$(
    curl --silent "https://api.github.com/repos/goodwithtech/dockle/releases/latest" | \
    grep '"tag_name":' | \
    sed -E 's/.*"v([^"]+)".*/\1/'
)

# Скачивание последнего релиза Dockle
curl -L -o dockle.deb "https://github.com/goodwithtech/dockle/releases/download/v${VERSION}/dockle_${VERSION}_Linux-64bit.deb"

# Установка пакета
sudo dpkg -i dockle.deb

# Очистка
rm dockle.deb

# Проверка установки
dockle --version
