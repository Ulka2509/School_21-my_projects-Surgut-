#!/bin/bash

if [[ $# -ne 0 ]]; then
	echo "Здесь не должно быть параметров."
	exit 1
fi

mkdir access_logs

. ./log_generation.sh
