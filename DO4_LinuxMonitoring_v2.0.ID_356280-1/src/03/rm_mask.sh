#!/bin/bash

echo -e "Введите маску файлов для удаления в формате _DDMMYY"
read mask
find / -type d -name "*$mask*" -print0 2>/dev/null|
while IFS= read -r -d '' dir; do
    rm -r "$dir"
    echo "${dir} deleted"
done 
