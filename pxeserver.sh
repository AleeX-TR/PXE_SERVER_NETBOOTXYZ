#!/bin/bash
#Diretório do TFTPBOOT
TFTP="/var/lib/tftpboot"

# Exportando o recurso de Noninteractive do Debconf para não solicitar telas de configuração
export DEBIAN_FRONTEND="noninteractive"

#Iniciando as configurações
echo -e " "
echo -e "Iniciando o Script :D...\n"
sleep 1

# Atualizando / Instalando o DNSMASQ
echo -e "Atualizando / Instalando o Serviço do dnsmasq...\n"
        apt -y install dnsmasq
echo -e " "		
sleep 5

# Transferindo os arquivos necessários para o diretório correto
echo -e "Copiando os arquivos e diretórios necessário\n"
        cp -r var/lib/tftpboot $TFTP
        cp -r etc/dnsmasq.conf /etc/
echo -e "Estrutura de arquivos e diretórios copiados com sucesso!!!\n"
sleep 2

# Reiniciando os serviços
echo -e "Reboot no Service do dnsmasq\n"
        service dnsmasq restart
sleep 3

#fim
echo -e "Script Finalizado :D \n"
sleep 5
exit 1