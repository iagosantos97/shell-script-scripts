#!/usr/bin/env bash

## delete all files including hidden ones

# dentro do diretório que deseja remover os arquivos execute:
for filename in $(ls -A1);do sudo rm -rf $filename;done;