#!/bin/bash

# Verifica se o kubectl está instalado
kubectl_installed=$(command -v kubectl)

if [ -z "$kubectl_installed" ]; then
    echo "O kubectl não está instalado no seu sistema."
else
    echo "Instalando o kube-hunter no namespace default..."

    # Aplicação do kube-hunter.yaml
    kubectl apply -f https://raw.githubusercontent.com/aquasecurity/kube-hunter/master/job.yaml

    echo "Esperando o kube-hunter concluir..."
    sleep 10

    echo "Executando o kube-hunter..."

    # Obtendo o nome do pod kube-hunter
    pod_name=$(kubectl get pods -n default -l app=kube-hunter -o jsonpath='{.items[0].metadata.name}')

    # Executando o kube-hunter
    kubectl exec -n default "$pod_name" kube-hunter > kube-hunter-scan.txt

    echo "Resultado do kube-hunter foi salvo no arquivo kube-hunter-scan.txt"

    # Convertendo o arquivo de log para PDF usando pandoc (requer pandoc instalado)
    pandoc -o kube-hunter-scan.pdf kube-hunter-scan.txt
    echo "Arquivo kube-hunter-scan.pdf foi criado."
fi
