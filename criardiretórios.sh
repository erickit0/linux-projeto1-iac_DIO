#!/bin/bash

# Definindo variáveis com os nomes dos grupos de usuários
GRP_ADM="administradores"
GRP_VEN="vendedores"
GRP_SEC="seguranca"

# Definindo variável com a senha padrão dos usuários
SENHA_PADRAO="Senha123"

# Criando diretórios e definindo suas permissões
echo "Criando diretórios..."
mkdir -m 777 /publico
mkdir -m 770 /adm
mkdir -m 770 /ven
mkdir -m 770 /sec

# Criando grupos de usuários
echo "Criando grupos de usuários..."
groupadd $GRP_ADM
groupadd $GRP_VEN
groupadd $GRP_SEC

# Criando usuários e adicionando-os aos grupos correspondentes
echo "Criando usuários..."
useradd -m -s /bin/bash -p $(openssl passwd -crypt $SENHA_PADRAO) -G $GRP_ADM carlos
useradd -m -s /bin/bash -p $(openssl passwd -crypt $SENHA_PADRAO) -G $GRP_ADM maria
useradd -m -s /bin/bash -p $(openssl passwd -crypt $SENHA_PADRAO) -G $GRP_ADM joao

useradd -m -s /bin/bash -p $(openssl passwd -crypt $SENHA_PADRAO) -G $GRP_VEN debora
useradd -m -s /bin/bash -p $(openssl passwd -crypt $SENHA_PADRAO) -G $GRP_VEN sebastiana
useradd -m -s /bin/bash -p $(openssl passwd -crypt $SENHA_PADRAO) -G $GRP_VEN roberto

useradd -m -s /bin/bash -p $(openssl passwd -crypt $SENHA_PADRAO) -G $GRP_SEC josefina
useradd -m -s /bin/bash -p $(openssl passwd -crypt $SENHA_PADRAO) -G $GRP_SEC amanda
useradd -m -s /bin/bash -p $(openssl passwd -crypt $SENHA_PADRAO) -G $GRP_SEC rogerio

# Definindo permissões dos diretórios
echo "Especificando permissões dos diretórios...."
chown root:$GRP_ADM /adm
chown root:$GRP_VEN /ven
chown root:$GRP_SEC /sec

# Definindo permissões dos arquivos dentro dos diretórios
chmod 644 /publico/*
chmod 750 /adm/*
chmod 750 /ven/*
chmod 750 /sec/*

echo "Fim."
