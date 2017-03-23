#!/bin/bash

#-------------------------------------------------------------------------------
# -- IP
#-------------------------------------------------------------------------------
AXL_IP="10.196.165.188"
AXL_IP_MASK="255.255.254.0"
AXL_IP_PORT="5432 5434 3306 8080 9090" # tomcat front (8080) tomcat back (9090) - mysql (3306) - pgsql (5434)

H_NETSTAT="Proto|Recv-Q|Send-Q|Local   Address|Foreign   Address|State|PID/Program name|Timer"
H_IFCONFIG="Bcast|Masque|Hwaddr|Ethernet|locale|mtu|TX|collisions|octets"

#---------------------------------------------------------------------
#
#---------------------------------------------------------------------
alias ifconfig='ifconfig            | h -i $H_IFCONFIG addr eth0 lo inet6 inet inactive active 192 168 127.0.0.1 $AXL_IP_PORT $AXL_IP_MASK '

alias nnetstat='sudo netstat -ant | h -i 127.0.0.1 listen java postgres nginx mysqld established $AXEL_PORT $H_NETSTAT '   # verifie config et ports par default
                           # -antop SOUS debian

# savoir l OS de la machine distante   :   sudo nmap -O -v 10.196.164.48 | h -ni running open Microsoft Linux Windows done Scanning Starting Completed Initiating Discovered port on
# voir si un port distant est ouvert   :   nmap -p 80 example.com
# adresse IP distante                  :   host PRODATNV2BDD.mre.pub
alias sstatus='sudo service nginx status; sudo service postgresql status; sudo service mysql status'

alias ppid="ps axo pid,ppid,pgrp,tty,tpgid,sess,comm |awk '$2==1\' |awk '$1==$3\'"

# ne marche pas sur ZSH
# alias ppid-all="ps -lA | awk '$12 == "?" {print $4, $14}'"

alias zombie="ps -lA | grep '^. Z'"
# free -m
# alias myps="ps -eo size,pid,user,command --sort -size | awk '{ hr=$1/1024 ; printf("%13.2f Mb ",hr) } { for ( x=4 ; x<=NF ; x++ ) { printf("%s ",$x) } print "" }'"


# Read more: http://javarevisited.blogspot.com/2010/10/basic-networking-commands-in-linuxunix.html#ixzz3oLdX6imU
# • finding host/domain name and IP address - hostname
# • test network connection – ping
# • getting network configuration – ifconfig
# • Network connections, routing tables, interface statistics – netstat
# • query DNS lookup name – nslookup
# • communicate with other hostname – telnet
# • outing steps that packets take to get to network host – traceroute
# • view user information – finger
# • checking status of destination host - telnet


#...............................
#             PORT
#...............................

#...............................
#  sudo nmap -sT -O localhost
#...............................

# sudo netstat -antop | grep postgres
# sudo netstat -antop
# tcp        0      0 0.0.0.0:3306            0.0.0.0:*               LISTEN      1198/mysqld      off (0.00/0/0)
# tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      2137/nginx       off (0.00/0/0)
# tcp        0      0 127.0.0.1:5433          0.0.0.0:*               LISTEN      1239/postgres    off (0.00/0/0)

# - tous les ports qui ecoutent ?
# netstat -tulpen

#-----------------------------------------
# iptables
#-----------------------------------------
#
# TABLES                    :      sudo iptables -L
#
# nmap 10.196.165.31  # charles
# nmap 10.196.165.121 # axel
#
# supprime les tables
# sudo iptables -F
#
# ouvrir ton port ssh en INPUT et OUTPUT :
# sudo iptables -t filter -A INPUT -p TCP --dport 22 -j ACCEPT
# sudo iptables -t filter -A OUTPUT -p TCP --sport 22 -j ACCEPT
#
# comme cela tu vois le PPID qui utilise le port (pratique)
# netstat -ano | grep 443 | grep LISTEN
#
# lsof -i -P | grep :80
# netstat -lntu
# netstat -ano | grep 22 | grep LISTEN
# ok
# netstat -ta | grep LISTEN
# /etc/hosts = WIKI ?  redirection


#------------------------------------------------------
# PS et KILLS
#-------------------------------------------------------------------------------
# ps aux | grep '[p]ostgres: atn_01 atn_01.*idle'
# kill -9 18055
# yum install tmux
# cd ~postgres
# ps -aux | grep tomcat
# kill -9 6194
# axel  6194  2.5 13.2 8423456 2170412 ?     Sl   sept.02  26:56 /opt/java/current/bin/java -Djava.util.logging.config.file=/home/axel/.IntelliJIdea13/system/tomcat/Unnamed_medicis/conf/logging.properties -



# ps -ef | grep tomcat          # -- tomcat lauched ?
# sudo service tomcat7 status
# netstat -lnp | grep 8080
# netstat -a | grep 8080
