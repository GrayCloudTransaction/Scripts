#!/bin/bash
sudo apt update && sudo apt upgrade -y #atualizando pacotes

java -version #verificando versao atual do java
if [ $? = 0 ]; #se retorno for igual a 0
then #entao,
echo “Cliente possui java instalado” #print no terminal
else #se nao,
echo “Cliente não possui java instalado” #print no terminal
echo “Gostaria de instalar o java? [s/n]” #print no terminal
read get #variável que guarda resposta do usuário
if [ \“$get\” == \“s\” ]; #se retorno for igual a s
then #entao
sudo apt install openjdk-17-jre -y #executando instalacao do java
echo "Java instalado com sucesso!"
else {
echo "Cancelando instalação do Java"
}
fi #fechando o 2º if
fi #fechando o 1º if

echo "Inicializando NMON"
nmon

mkdir CapturasNMON #criando pasta para armazenar as capturas do NMON
cd /home/ubuntu/CapturasNMON #alterando para a pasta criada
nmon -f -s 5 -c 10 #capturando  dados, com leituras a cada 5 segundos, 10 vezes em s>

wget https://raw.githubusercontent.com/MarcioIoT/NmonVisualizer/main/NMONVisualizer.jar #instalando visualizador de dados capturados via NMON
