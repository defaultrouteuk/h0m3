#!/usr/bin/env bash

ZOC_PATH=/Applications/zoc8.app
HOST=::1

for (( i=9000; i<=9034; i++ )); do
    lsof -i -P -n | grep $i 1>/dev/null 2>&1
    if [ $? -eq 0 ]; then
        open -n -a $ZOC_PATH --args /CONNECT=TELNET![$HOST]:$i /TABBED /TITLE:R$i
    fi
done
