#!/bin/bash

if [[ "$#" -ne 2 ]]
then
echo "Modo de uso: ./$(basename $0) <env_file> <secret_name>"
echo "Exemplo: ./create-secret.sh .env.dev auth-depl-dev"
exit 1
fi


# Arquivo .env
env_file="$1"

# Nome do segredo
secret_name="$2"

# Inicia a criação do comando
command="kubectl create secret generic $secret_name"

# Lê o arquivo .env e adiciona cada variável ao comando
while IFS='=' read -r key value; do
    # Verifica se a linha não está vazia
    if [ -n "$key" ] && [ -n "$value" ]; then
        # Adiciona a variável ao comando
        command="$command --from-literal=$key=\"$value\""
    fi
done < "$env_file"

# Executa o comando
# echo "Executando: $command"
eval $command
