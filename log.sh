#!/bin/bash

################################################################################
# LOG PROD
################################################################################
# ----------------------------------------------------------------------------
function log_web_PROD(){
# ----------------------------------------------------------------------------
  DATE=`date +%Y-%m-%d`
  sshpass -p "innovation" scp root@$PROD_WWW_DOMAIN:$PROD_LOG_TOMCAT/atnv2.log $AXL_HOME_LOG/0-prod-tomcat-atnv2.log
  sshpass -p "innovation" scp root@$PROD_WWW_DOMAIN:$PROD_LOG_TOMCAT/catalina.out $AXL_HOME_LOG/1-prod-tomcat-catalina-out.log # INFO: Server startup in 77037 ms = info is set up
  sshpass -p "innovation" scp root@$PROD_WWW_DOMAIN:$PROD_LOG_TOMCAT/localhost_access_log..$DATE.txt $AXL_HOME_LOG/2-prod-tomcat-localhost_access-$DATE.log
}
# ------------------------------------------------------------------------------
function log_nginx_PROD(){
# ------------------------------------------------------------------------------
  # /var/log/nginx/ = c est USELESS
  sshpass -p "innovation" scp root@$PROD_WWW_DOMAIN:$PROD_LOG_NGINX/access.log $AXL_HOME_LOG/3-prod-nginx-access.log # /var/log/atnv2/nginx/access.log    # USELESS
  sshpass -p "innovation" scp root@$PROD_WWW_DOMAIN:$PROD_LOG_NGINX/error.log $AXL_HOME_LOG/4-prod-nginx-error.log
}
# ------------------------------------------------------------------------------
function log_pgsql_PROD(){
# ------------------------------------------------------------------------------
  DATE_SHORT=`LANG=en_US date +%A`
  DATE_SHORT_3=${DATE_SHORT:0:3}
  # ATTENTION non iso REC-PROD: VAR/L-O-G
  sshpass -p "innovation" scp root@$PROD_DB_DOMAIN:$PROD_LOG_PGSQL/postgresql-${DATE_SHORT_3}.log $AXL_HOME_LOG/5-prod-pgsql-${DATE_SHORT_3}.log
}

################################################################################
# LOG REC
################################################################################
# ----------------------------------------------------------------------------
function log_web_REC(){
# ----------------------------------------------------------------------------
  DATE=`date +%Y-%m-%d`
  sshpass -p "innovation" scp root@$REC_WWW_DOMAIN:$REC_LOG_TOMCAT/atnv2.log $AXL_HOME_LOG/a-rec-tomcat-atnv2.log
  sshpass -p "innovation" scp root@$REC_WWW_DOMAIN:$REC_LOG_TOMCAT_CATALINA/catalina.out $AXL_HOME_LOG/b-rec-tomcat-catalina-out.log # INFO: Server startup in 77037 ms = info is set up
  sshpass -p "innovation" scp root@$REC_WWW_DOMAIN:$REC_LOG_TOMCAT_CATALINA/localhost_access_log..$DATE.txt $AXL_HOME_LOG/c-rec-tomcat-localhost_access-$DATE.log
}
# ------------------------------------------------------------------------------
function log_nginx_REC(){
# ------------------------------------------------------------------------------
  sshpass -p "innovation" scp root@$REC_WWW_DOMAIN:$REC_LOG_NGINX/access.log $AXL_HOME_LOG/d-rec-nginx-access.log # /var/log/atnv2/nginx/access.log == USELESS
  sshpass -p "innovation" scp root@$REC_WWW_DOMAIN:$REC_LOG_NGINX/error.log $AXL_HOME_LOG/e-rec-nginx-error.log
}
# ------------------------------------------------------------------------------
function log_pgsql_REC(){
# ------------------------------------------------------------------------------
  DATE_SHORT=`LANG=en_US date +%A`
  DATE_SHORT_3=${DATE_SHORT:0:3}
  # ATTENTION non iso REC-PROD : VAR/L-I-B
  sshpass -p "innovation" scp root@$PROD_DB_DOMAIN:$REC_LOG_PGSQL/postgresql-${DATE_SHORT_3}.log $AXL_HOME_LOG/f-rec-pgsql-${DATE_SHORT_3}.log
}

################################################################################
# SCP TOUS LES LOG (6 fichiers normalement)
################################################################################
# ------------------------------------------------------------------------------
function megalogprod(){
# ------------------------------------------------------------------------------
  log_web_PROD
  log_nginx_PROD
  log_pgsql_PROD
}
# ------------------------------------------------------------------------------
function megalogrec(){
# ------------------------------------------------------------------------------
  log_web_REC
  log_nginx_REC
  log_pgsql_REC
}
################################################################################
