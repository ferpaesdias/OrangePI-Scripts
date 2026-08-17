#!/bin/bash

###########
##
## Instalação do Pi-hole
## 
##
## A execução do script deve ser feita com o usuário root
## 
##########

set -e

# Configura as variáveis de ambiente
source config/.env

# Download do script de instalação  
wget -O basic-install.sh https://install.pi-hole.net

# Copiar o arquivo pihole.toml
mkdir -p /etc/pihole
cp config/pihole.toml /etc/pihole/pihole.toml

# Instalação do Pi-hole
bash basic-install.sh --unattended

# Atualizar senha
pihole setpassword ${PASSWORD_PIHOLE}

# Atualizar o Gravity
pihole updateGravity

