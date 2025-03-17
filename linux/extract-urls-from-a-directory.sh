#!/bin/bash

# Verifica se o diretório foi passado como argumento
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <diretório>"
    exit 1
fi

diretorio=$1

# A expressão regular abaixo é uma tentativa simples de detectar a maioria das URLs.
# Pode não pegar todas as URLs possíveis ou pode pegar algumas strings que não são URLs.
url_regex='https?://[^ ]+'

path_regex='/[^ ]+'

echo $diretorio

# Usando grep para buscar recursivamente no diretório fornecido
egrep -ohr "$url_regex" "$diretorio" | grep -v "Binary file" | sort | uniq | sed 's/"//g;s/)//g;' > "$(basename $diretorio)-urls.txt"

egrep -or "$path_regex" "$diretorio" | grep -v "Binary file" | sort | uniq > "$(basename $diretorio)-paths.txt"

#grep -oE "$url_regex" -r "$diretorio" | awk -F: '{print $2":"$3}' | sort | uniq > file2.txt

exit 0
