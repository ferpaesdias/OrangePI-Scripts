#!/bin/bash

###########
##
## Instalação de aplicativos básicos
## 
##
## A execução do script deve ser feita com o usuário root
## 
##########

# Atualização do SO
apt update && apt upgrade -y


# Instalação dos apps
apt install -y git \
               vim \
               curl \
               wget \
               zsh

# Download do Oh My Zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh

# Instalação do Oh My Zsh
sh install.sh --unattended

# Configurar o zsh como default
chsh -s $(which zsh)

# Alterar o tema do Oh My Zsh para o tema crcandy
sed -i 's/^ZSH_THEME=".*"/ZSH_THEME="crcandy"/' .zshrc

