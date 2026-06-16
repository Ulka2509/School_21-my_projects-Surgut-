#!/bin/bash

if [[ $# -ne 1 ]]; then
	echo "Здесь должен быть один параметр."
	exit 1
fi

if ! [[ $1 =~ [[:digit:]] ]]; then
	echo -e "Параметр должен быть числовой."
	exit 1
fi

if ! [[ $1 -eq 1 || $1 -eq 2 || $1 -eq 3 || $1 -eq 4 ]]; then
	echo -e "Параметр должен быть эквивалентен 1, 2, 3 или 4."
	exit 1
fi
