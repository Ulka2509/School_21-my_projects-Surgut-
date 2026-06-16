#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Введи, ровно, один параметр."
	exit 1
fi

if ! [[ $1 =~ [[:digit:]] ]]; then
	echo -e "Параметр должен быть числом."
	exit 1
fi

if ! [[ $1 -eq 1 || $1 -eq 2 || $1 -eq 3 ]]; then
	echo -e "Параметр должен быть равен 1, 2 или 3."
	exit 1
fi
