#!/bin/bash

delete_files_logs() {
    directory="$1"
	#Verifica se o diretório foi especificado
    if [ -z "$directory" ]; then
        echo "Diretório não especificado."
        exit 1
    fi
	#Verifica se o diretório existe
    if [ ! -d "$directory" ]; then
        echo "O diretório $directory não existe."
        exit 1
    fi
    # Verifica se existe algum arquivo dentro do diretório
    if [ -z "$(ls -A "$directory")" ]; then
        echo "O diretório $directory está vazio. Nenhum arquivo para excluir."
        exit 0
    else
    #Se o diretório não estiver vazio, exclua os arquivos
        rm "$directory"/*
        echo "Arquivos em $directory excluídos com sucesso."
    fi
}

delete_files_logs "/home/ec2-user/LogsServices"