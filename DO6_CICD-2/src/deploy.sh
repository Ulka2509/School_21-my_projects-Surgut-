#!/bin/bash
REMOTE_HOST="192.168.0.8"
REMOTE_USER="rosa"
REMOTE_DIR="/usr/local/bin/"

  scp -r -o StrictHostKeyChecking=no ./src/cat/s21_cat ./src/grep/s21_grep $REMOTE_USER@$REMOTE_HOST:/tmp/

  ssh -o StrictHostKeyChecking=no $REMOTE_USER@$REMOTE_HOST "mv /tmp/s21_cat $REMOTE_DIR; mv /tmp/s21_grep $REMOTE_DIR"

echo "Файлы успешно скопированы"
