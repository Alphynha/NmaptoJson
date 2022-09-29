#!/bin/bash
echo "Execute esse script apenas uma vez!"
echo
echo "Este script verifica se os pacotes Nmap, Golang e jq estão instalados na máquina. Em seguida, será feito a instalação da ferramenta Nmap-Formatter através do Golang"
echo
echo "O script irá executar a instalação de novos pacotes, deseja realmente continuar? (s/n)"
read escolha
if [ "$escolha" = n ] ;
then
exit
fi
echo -n "Verificando Nmap: "
pacote=$(dpkg --get-selections | grep "nmap" ) 
echo 
echo -n "Verificando se o Nmap está instalado."
sleep 2
if [ -n "$pacote" ] ;
then echo
     echo "Pacote Nmap já instalado"
else echo
     echo "Pacote Nmap não está instalado"
     echo "Instalando Nmap..."
     sudo apt install nmap -y
fi
echo
echo "Verificando Golang: "
echo "Verificando se o Golang está instalado"
pacote2=$(dpkg --get-selections | grep "golang" )
sleep 2
if [ -n "$pacote2" ] ;
then 
     echo "Pacote Golang já instalado"
else echo
     echo "Pacote Golang não está instalado"
     echo "Instalando Golang..."
     sudo apt install golang -y
fi
echo
echo "Por fim, instalando a ferramenta necessária para conversão de arquivos"
go install github.com/vdjagilev/nmap-formatter@latest
echo
echo "Agora para finalizar, vamos instalar a ferramenta jq"
echo "Verificando se o jq já está instalado"
pacote3=$(dpkg --get-selections | grep "jq" )
if [ -n "$pacote3" ] ;
then
     echo "Pacote jq já instalado"
else echo
     echo "Pacote jq não está instalado"
     echo "Instalando jq..."
     sudo apt install jq -y
fi
echo
echo "Script finalizado!"
echo -n "Pressione Enter para sair..."
read
exit
