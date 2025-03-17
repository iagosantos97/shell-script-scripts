#!/usr/bin/env bash

SERVER="www.businesscorp.com.br"
PORT="80"

FILE="urls.txt"

#IFS-> INTERNAL FIELD SEPARATOR
while IFS= read -r url
do

    echo -ne "GET: $url\t"
    echo -e "GET /$url HTTP/1.0\nHost:$SERVER\n" | nc "$SERVER" "$PORT" | head -n 1

done < "$FILE" | tee resp
