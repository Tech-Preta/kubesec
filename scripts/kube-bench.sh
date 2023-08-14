#!/bin/bash

# Verifica se o kubectl está instalado
kubectl_installed=$(command -v kubectl)

if [ -z "$kubectl_installed" ]; then
    echo "O kubectl não está instalado no seu sistema."
else
    echo "Instalando o kube-bench no namespace default..."

    # Aplicação do kube-bench.yaml
    kubectl apply -f https://raw.githubusercontent.com/aquasecurity/kube-bench/master/job.yaml

    echo "Esperando o kube-bench concluir..."
    sleep 10

    echo "Visualizando e salvando os logs do kube-bench..."

    # Obtendo o nome do pod kube-bench
    pod_name=$(kubectl get pods -n default -l app=kube-bench,job-name=kube-bench -o jsonpath='{.items[0].metadata.name}')

    # Obtendo os logs do pod
    kubectl logs -n default "$pod_name" > kube-bench-scan.txt

    echo "Logs do pod $pod_name foram salvos no arquivo kube-bench-scan.txt"

    # Convertendo o arquivo de log para PDF usando pandoc (requer pandoc instalado)
    pandoc -o kube-bench-scan.pdf kube-bench-scan.txt
    echo "Arquivo kube-bench-scan.pdf foi criado."
fi

