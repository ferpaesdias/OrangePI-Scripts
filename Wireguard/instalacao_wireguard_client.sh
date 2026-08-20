#!/bin/bash

###########
##
## Instalação do cliente do Wireguard
## 
##
## A execução do script deve ser feita com o usuário root
## 
##########

set -e

# Configura as variáveis de ambiente
source config/.env

# Atualização do repositório do SO
apt update

# Instalação de ferramentas
apt install -y wireguard wireguard-tools

# Gerar par de chave do cliente
cd /etc/wireguard
  umask 077
  wg genkey | tee client_private.key | wg pubkey > client_public.key
  WG_CLIENT_PRIVATE_KEY=$(cat client_private.key)
  
# Cria o arquivo de configuração do Wireguard
cat << EOF > /etc/wireguard/wg0.conf
[Interface]
  PrivateKey = ${WG_CLIENT_PRIVATE_KEY}
   Address = ${WG_IP_ClIENT}

[Peer]
  PublicKey = ${WG_SERVER_PUBLIC_KEY}
  Endpoint = ${WG_SERVER_ADDRESS}:${WG_PORT}
  AllowedIPs = ${WG_ALLOWED_IPS}
  PersistentKeepalive = 25
EOF

# Ajuste de segurança do arquivo /etc/wireguard/wg0.conf
chmod 600 /etc/wireguard/wg0.conf

# Iniciar e configurar como serviço o cliente Wireguard
systemctl enable --now wg-quick@wg0  