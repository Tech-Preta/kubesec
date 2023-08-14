#!/bin/bash

echo "Verificando se o marvin está instalado..."

# Verificando se o marvin CLI está instalado
if ! command -v marvin &>/dev/null; then
    echo "O marvin não está instalado. Baixando e instalando o marvin..."

    # Baixando o marvin CLI
    curl -sSfL -o marvin https://github.com/undistro/marvin/releases/latest/download/marvin-$(uname -s)-$(uname -m)
fi

echo "Executando o scan com o marvin..."

# Executando o scan com o marvin
marvin scan > marvin-scan.txt

echo "Resultado do scan do marvin foi salvo no arquivo marvin-scan.txt"

# Convertendo o arquivo de log para PDF usando pandoc (requer pandoc instalado)
pandoc -o marvin-scan.pdf marvin-scan.txt
echo "Arquivo marvin-scan.pdf foi criado."
