#!/bin/bash

echo -e "Введите дату и время начала удаления файлов в формате YYYY-MM-DD HH:MM"
read birth_time

echo -e "Введите дату и время окончания удаления файлов в формате YYYY-MM-DD HH:MM"
read end_time

start=$(date -d "$birth_time" +%s)
end=$(date -d "$end_time" +%s)

while read -r line; do
    time=$(echo "$line" | awk -F ' - ' '{print $1}')
    dir=$(echo "$line" | awk -F ' - ' '{print $2}')

    dir_time=$(date -d "$time" +%s)

    if [[ $dir_time -ge $start && $dir_time -le $end ]]; then
        if [[ -d $dir ]]; then
            rm -r "$dir"
            echo "${dir} deleted"
        fi
    fi

done < "$logfile"

