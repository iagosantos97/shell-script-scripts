#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <diretório>"
    exit 1
fi

diretorio=$1

url_regex='https?://[^ ]+'

path_regex='/[^ ]+'

echo $diretorio

egrep -ohr "$url_regex" "$diretorio" | grep -v "Binary file" | sort | uniq | sed 's/"//g;s/)//g;' > "$(basename $diretorio)-urls.txt"

egrep -or "$path_regex" "$diretorio" | grep -v "Binary file" | sort | uniq > "$(basename $diretorio)-paths.txt"


exit 0
