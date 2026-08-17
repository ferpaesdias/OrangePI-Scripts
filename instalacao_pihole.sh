#!/bin/bash

###########
##
## Instalação do Pi-hole
## 
##
## A execução do script deve ser feita com o usuário root
## 
##########

# Configura as variáveis de ambiente
source .env

# Download do script de instalação  
#wget -O basic-install.sh https://install.pi-hole.net

# Copiar o arquivo pihole.toml
mkdir -p /etc/pihole
cp pihole.toml /etc/pihole/pihole.toml

# Instalação do Pi-hole
bash basic-install.sh --unattended

# Atualizar senha
pihole setpassword ${PASSWORD_PIHOLE}

# Atualizar o Gravity
pihole updateGravity

