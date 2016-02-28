#!/bin/bash
#-------------------------------------------------------------------------------
# DOMAIN
#-------------------------------------------------------------------------------
PROD_DB_DOMAIN="prodatnv2bdd.mre.pub"
PROD_WWW_DOMAIN="prodatnv2web.mre.pub"

REC_DB_DOMAIN="10.196.165.17"
REC_WWW_DOMAIN="10.196.164.15"

J_DEV_DOMAIN="devschedulerweb.mre.pub"          # 10.196.164.237
J_PROD_DOMAIN="prodschedulerweb.mre.pub"        # 10.196.165.118
J_CONT_DOMAIN="jenkins.mre.pub"                 # ANCIEN = useless, ne pas utiliser
J_CONT_DOMAIN_2="prodjenkinsweb.mdv.pub"        # NEW (avec new nom de domaine)

# production        PRODATNV2GBLC.mre.pub        10.196.164.48           # adminmv / innovation
# pré-production    preprodatnv2gblc.mre.pub     10.196.165.224          # root / innovation

#-------------------------------------------------------------------------------
# LOG
#-------------------------------------------------------------------------------
# PROD_LOG_TOMCAT="/var/atnv2/tomcat/logs"  # only tomcat (catalina....host-manager, access...)
PROD_LOG_TOMCAT="/var/log/atnv2/tomcat"  # only tomcat (catalina....host-manager, access...)
REC_LOG_TOMCAT="/var/atn/backend"         # atnv2.log (OK)  > n existe pas sur PROD
REC_LOG_TOMCAT_CATALINA="/var/log/atnv2/tomcat"

PROD_LOG_PGSQL="/var/log/pgsql/9.4"
REC_LOG_PGSQL="/var/lib/pgsql/9.4/data/pg_log"

PROD_LOG_NGINX="/var/log/atnv2/nginx"
REC_LOG_NGINX="/var/log/atnv2/nginx"
