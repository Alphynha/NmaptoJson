#!/bin/bash
echo "Esse script executa um scan utilizando nmap em um alvo"
echo
echo "Digite o alvo Ip/Nome"
read alvo
echo "Digite o tipo do ataque"
echo "-F para Scan Rápido"
echo "-A para Scan Agressivo"
echo "Enter para Scan padrão"
read scan
nmap $scan -oX scan.xml $alvo > /dev/null
cat scan.xml | ~/go/bin/nmap-formatter json | jq
