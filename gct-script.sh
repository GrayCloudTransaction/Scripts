#!/bin/bash
sudo apt update && sudo apt upgrade -y #atualizando pacotes

# Config.
versao_recomendada_java="17.0.6"

echo " ██████╗ ██████╗ ███████╗██╗   ██╗"
echo "██╔════╝ ██╔══██╗██╔════╝╚██╗ ██╔╝"
echo "██║  ██╗ ██████╔╝█████╗   ╚████╔╝"
echo "██║  ╚██╗██╔══██╗██╔══╝    ╚██╔╝"
echo "╚██████╔╝██║  ██║███████╗   ██║"
echo " ╚═════╝ ╚═╝  ╚═╝╚══════╝   ╚═╝"
echo ""
echo " █████╗ ██╗      █████╗ ██╗   ██╗██████╗"
echo "██╔══██╗██║     ██╔══██╗██║   ██║██╔══██╗"
echo "██║  ╚═╝██║     ██║  ██║██║   ██║██║  ██║"
echo "██║  ██╗██║     ██║  ██║██║   ██║██║  ██║"
echo "╚█████╔╝███████╗╚█████╔╝╚██████╔╝██████╔╝"
echo " ╚════╝ ╚══════╝ ╚════╝  ╚═════╝ ╚═════╝"
echo ""
echo "████████╗██████╗  █████╗ ███╗  ██╗ ██████╗ █████╗  █████╗ ████████╗██╗ █████╗ ███╗  ██╗ ██████╗"
echo "╚══██╔══╝██╔══██╗██╔══██╗████╗ ██║██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██║██╔══██╗████╗ ██║██╔════╝"
echo "   ██║   ██████╔╝███████║██╔██╗██║╚█████╗ ███████║██║  ╚═╝   ██║   ██║██║  ██║██╔██╗██║╚█████╗ "
echo "   ██║   ██╔══██╗██╔══██║██║╚████║ ╚═══██╗██╔══██║██║  ██╗   ██║   ██║██║  ██║██║╚████║ ╚═══██╗"
echo "   ██║   ██║  ██║██║  ██║██║ ╚███║██████╔╝██║  ██║╚█████╔╝   ██║   ██║╚█████╔╝██║ ╚███║██████╔╝"
echo "   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚══╝╚═════╝ ╚═╝  ╚═╝ ╚════╝    ╚═╝   ╚═╝ ╚════╝ ╚═╝  ╚══╝╚═════╝ "

linha="=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"

echo $linha
echo "                             [@] SCRIPT DE INSTALAÇÃO"
echo "                             [@] Equipe GCT - 1° CCO "
echo $linha

echo ""

echo "[!] Fazendo verificação do Java"
which java | grep /usr/bin/java

if [ $? = 0 ]; then
	versao_java=$(java -version 2>&1 | awk -F'"' '{print $2}')
        echo "[!] Versão do Java Instalada: $versao_java"
        
        if [ "$versao_java" = $versao_recomendada_java ]; then 
		echo "[!] Esta versão está de acordo com a API da GCT."
		echo "[!] Finalizando o Script."
            else    
                echo "[ALERT] Esta versão NÃO é adequada para a API da GCT."
                echo "[?] Deseja atualizar para a versão recomendada? [s/n]"
                
                read escolha
                
                if [ $escolha = "s" ]; then
		        sudo apt-get install openjdk-17-jre -y
		        echo "[!] O Java foi atualizado com sucesso."
		        echo "[!] Finalizando o script"
                    else
                        echo "[!] Finalizando o script de instalação!"
		fi
		fi
	else
		echo ""
		echo "[ALERT] O Java não está instalado"
		echo "[?] Deseja Instalar o Java? [s/n]"
		
		read get
		
		if [ $get = "s" ]; then
			sudo apt-get install openjdk-17-jre -y
			echo "[!] O Java foi  Instalado!"
		else
			echo "Cancelando instalação"
		fi
fi

echo "Inicializando NMON"
nmon

mkdir CapturasNMON #criando pasta para armazenar as capturas do NMON
cd /home/ubuntu/CapturasNMON #alterando para a pasta criada
nmon -f -s 5 -c 10 #capturando  dados, com leituras a cada 5 segundos, 10 vezes em s>

echo "Verificando se tem NMON instalado"
which nmon | grep /usr/bin/nmon

if [ $? = 0 ]; then 
	echo “Cliente possui NMON instalado”
else
	sudo apt install nmon #instalando NMON
	wget https://raw.githubusercontent.com/MarcioIoT/NmonVisualizer/main/NMONVisualizer.jar #instalando visualizador de dados capturados via NMON
	echo "NMON instalado com sucesso!"
fi






