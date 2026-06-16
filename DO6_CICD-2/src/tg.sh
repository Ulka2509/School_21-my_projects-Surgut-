#!/bin/bash
STAGE_TYPE=$1
BOT_TOKEN="7522564276:AAHMQW3UQbr08cIkKkKIgWFw0jR3MzEAKac"
CHAT_ID="5127900760"

sleep 5

if [ "$CI_JOB_STATUS" == "success" ]; then
    MESSAGE="✅ Статус $STAGE_TYPE ☞$CI_JOB_NAME☚ успешно пройдена ✅ $CI_PROJECT_URL/pipelines"
else
    MESSAGE="🆘 Статус $STAGE_TYPE ☞$CI_JOB_NAME☚ пройдена с предупреждениями 🆘 $CI_PROJECT_URL/pipelines"
fi

curl -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" -d chat_id=$CHAT_ID -d text="$MESSAGE"
