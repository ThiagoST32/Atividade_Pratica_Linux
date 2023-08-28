#!/bin/bash

# Defino o nome do serviço que você deseja verificar
NOME_DO_SERVICO="httpd"

# Defino o diretório no NFS para onde você deseja enviar os resultados
DIRETORIO_NFS="/root/CheckService/"

# Defino o endereço IP do servidor NFS
IP_DO_NFS="192.168.100.95/24"

# Função para verificar o status do serviço
verificar_servico() {
	if systemctl is-active $NOME_DO_SERVICO >/dev/null 2>&1; then
		STATUS="Online"
		MENSAGEM="O serviço está online."
		ARQUIVO_RESULTADO="$DIRETORIO_NFS/resultado_servico_httpd_online.txt"
	else
		STATUS="Offline"
		MENSAGEM="O serviço está offline."
		ARQUIVO_RESULTADO="$DIRETORIO_NFS/resultado_servico_httpd_offline.txt"
	fi
}

#Pego a data e hora atual
DATA_HORA=$(date +"%Y-%m-%d %H:%M:%S")

#Chamo a função para verificar o status do serviço
verificar_servico

#Crio o conteúdo do arquivo de resultado
CONTEUDO="$DATA_HORA - Serviço: $NOME_DO_SERVICO - Status: $STATUS - $MENSAGEM"

#Escreve o conteúdo no arquivo de resultado no NFS
echo "$CONTEUDO" > "$ARQUIVO_RESULTADO"


echo "Resultado da verificação do serviço foi salvo em: $ARQUIVO_RESULTADO"