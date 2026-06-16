

## Part 7. **Prometheus** и **Grafana**

**== Задание ==**

##### Установи и настрой **Prometheus** и **Grafana** на виртуальную машину.
##### Получи доступ к веб-интерфейсам **Prometheus** и **Grafana** с локальной машины.

##### Добавь на дашборд **Grafana** отображение ЦПУ, доступной оперативной памяти, свободное место и кол-во операций ввода/вывода на жестком диске.

##### Запусти свой bash-скрипт из [Части 2](#part-2-засорение-файловой-системы).
##### Посмотри на нагрузку жесткого диска (место на диске и операции чтения/записи).

##### Установи утилиту **stress** и запусти команду `stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 10s`
##### Посмотри на нагрузку жесткого диска, оперативной памяти и ЦПУ.

Устанавливаю docker на ВМ `sudo apt install docker.io`.
Когда Docker установился, ввожу команду: `docker swarm init`.

Cоздаю директорию на виртуальной машине `grafana-docker-stack` c файлом `docker-compose.yml`.

Выполняю команду для развертывания стека: `docker stack deploy -c /home/lora/grafana-docker-stack/docker-compose.yml monitoring`

![03](./image/3.png)

Контейнеры поднялись:

![03](./image/3.1.png)

Вижу три контейнера: Grafana, Prometheus и Node Exporter. Затем захшла в браузер. У меня адрес сервера 192.168.0.8, Grafana доступна на порту 3000. 
После входа в Grafana добавила Prometheus в качестве источника данных. 

Настраеваю  promeyheus.yml

`sudo vim /var/lib/docker/volumes/monitoring_prom-configs/_data/prometheus.yml`


![03](./image/prometheus.png)

в браузере локальной машины на порту 9090 смотрю статус работы prometheus и node-exporter

![03](./image/status.png)

Свой дашборд 

![03](./image/1.1.png)

Устанавливаю и запускаю утилиту stress

![03](./image/stres1.png)

Запускаю скрипт засорения файловой системы

![03](./image/spam1.png)





