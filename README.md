# Kubesec - Relatórios de Segurança para Clusters Kubernetes

O projeto Kubesec é uma solução abrangente para análise e relatórios de segurança em clusters Kubernetes. Ele combina várias ferramentas populares, como o marvin, kube-bench, kubescan e popeye, para fornecer insights detalhados sobre a segurança do seu ambiente Kubernetes. O projeto automatiza a execução dessas ferramentas e gera relatórios claros e informativos para ajudar os administradores de clusters a entender e melhorar a postura de segurança de seus clusters.

## Introdução

Manter a segurança em clusters Kubernetes é uma tarefa crítica para garantir que suas aplicações e dados estejam protegidos. O projeto Kubesec foi desenvolvido para facilitar essa tarefa, fornecendo uma solução abrangente para avaliação e geração de relatórios de segurança.

## Ferramentas Incluídas

O Kubesec utiliza as seguintes ferramentas para análise de segurança:

- [marvin](https://github.com/undistro/marvin): Ferramenta de segurança para Kubernetes que verifica vulnerabilidades em imagens de contêineres e seus artefatos.
- [popeye](https://github.com/derailed/popeye): Ferramenta que analisa clusters Kubernetes em busca de problemas de configuração e recursos ociosos.
- [kube-hunter](https://github.com/aquasecurity/kube-hunter): Ferramenta que executa testes de segurança em clusters Kubernetes para identificar possíveis vulnerabilidades.
- [kube-bench](https://github.com/aquasecurity/kube-bench): Ferramenta que verifica a conformidade do cluster Kubernetes com os benchmarks do CIS.

## Pré-requisitos

- kubectl: A ferramenta de linha de comando Kubernetes (kubectl) é essencial para interagir com e gerenciar clusters Kubernetes.`Para realizar sua instalação:

```
sudo apt-get update
sudo apt-get install kubectl
```

- curl: O utilitário de linha de comando curl é usado para fazer requisições de transferência de dados por URL. Para realizar sua instalação:

```
sudo apt-get update
sudo apt-get install curl
```

- pandoc: O Pandoc é uma ferramenta de conversão de documentos que pode ser usada para converter entre diferentes formatos de arquivo, como Markdown para PDF. Para realizar sua instalação:

```
sudo apt-get update
sudo apt-get install pandoc
```

Para melhor visualizar os relatórios do popeye:

```
export TERM=xterm-256color
```

## Instruções de Uso

1. Clone este repositório em sua máquina local:

```
git clone https://github.com/nataliagranato/kubesec.git
```

2. Navegue para o diretório do projeto:

```
cd kubesec
```

## Geração de relatórios

- Executar o ./kube-bench para avaliar a conformidade do cluster com os benchmarks do CIS.

- Executar o ./kube-hunter para identificar possíveis vulnerabilidades no cluster.
- Executar o ./marvin para analisar as imagens de contêineres em busca de vulnerabilidades.
- Executar o ./popeye para identificar problemas de configuração e recursos ociosos.

## Contribuição

Contribuições são bem-vindas! Se você deseja adicionar novos scripts, aprimorar os existentes ou sugerir melhorias, sinta-se à vontade para criar um pull request.

## Licença

Este projeto é licenciado sob a [GNU General Public License v3.0](https://github.com/nataliagranato/kubeshell/blob/main/LICENSE).
