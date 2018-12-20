#!/bin/bash
#Todos os direitos reservados.
#Direitos autorais CosmosTI.
#Desevolvido pelo Clube da Tecnologia.
#dev        :Guilherme Pacheco
#criado     :07/07/2012

#editado por: Guilherme Pacheco	
#editado    : 25/07/2014

#Script para instalação do servidor do Bind configurado para DNS dos servidores da cosmosTI.

sudo apt-get upgrade
sudo apt-get update

sudo apt-get install -y bind9 dnsutils bind9utils bind9-doc 
#resolvconf

sudo mkdir /etc/bind/zones

sudo wget https://github.com/guilhermepachecod/db.meudominio.com.br
sudo wget https://github.com/guilhermepachecod/named.conf.local.master
sudo wget https://github.com/guilhermepachecod/named.conf.local.slave
sudo wget https://github.com/guilhermepachecod/named.conf.options

sudo tar xvf bindserverfiles.tar
sudo rm -f bindserverfiles.tar

#sudo cp rev /etc/bind/zones/rev
#sudo rm -f rev

sudo cp meudominio.com.br /etc/bind/zones/meudominio.com.br
sudo rm -f acertotec.com.br

sudo cp named.conf.options /etc/bind/named.conf.options
sudo rm -f named.conf.options

sudo cp named.conf.local /etc/bind/named.conf.local
sudo rm -f named.conf.local

sudo service bind9 restart
nslookup -type=MX meudominio.com.br
