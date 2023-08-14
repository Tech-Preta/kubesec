#!/bin/bash

echo "Verificando se o popeye está instalado..."

# Verificando se o popeye está instalado
if ! command -v popeye &>/dev/null; then
    echo "O popeye não está instalado. Baixando e instalando o popeye..."

    # Baixando o popeye
    curl -sSfL -o popeye.tar.gz https://github.com/derailed/popeye/releases/latest/download/popeye-linux-amd64.tar.gz
    tar -xzf popeye.tar.gz
    chmod +x popeye

    # Movendo o binário do popeye para a pasta correta
    mv popeye ~/.local/bin/

    echo "Popeye foi instalado."
fi

echo "Executando o popeye e gerando o relatório em HTML..."

# Executando o popeye e gerando o relatório em HTML
POPEYE_REPORT_DIR=$(pwd) popeye --save --out html --output-file report.html

echo "Relatório HTML do popeye foi gerado."
