#!/bin/bash

# Si ca marche pas, tu redemarres TOUT

# modifier en local ce qui change a chaque fois
alias nnginx='vi /etc/nginx/sites-enabled/default'
alias nnginxR='sudo service nginx restart'

################################################################################
# NGINX
################################################################################

function update_nginx_local(){
  # 1
  # /etc/nginx/nginx.conf
  # /etc/nginx/nginx.conf.default
  cd /etc/nginx/sites-available
  # 2
  # sert a TAPER sur le bon directory pour reccuperer les sources statiques
  # actualise cette ligne // CHANGE SNAP : il faut rajouter le numero de version ! tape sur les source du server Tomcat Front
  # root   /home/axel/com/atn_v2/frontend/target/atnv2-frontend-2.2.34-SNAPSHOT;
  # 3
  # sudo /etc/init.d/nginx restart
  # sudo nginx -s reload
  # nginx -t
  sudo service nginx restart
}

################################################################################
# TOMCAT
################################################################################
# CATALINA_HOME = /opt (moteur)
# CATALINA_BASE = /var (lib) (webapp)



# ------------------------------------------------------------------------------
# ps -ef | grep tomcat | grep -v grep | awk '{print $2}' | xargs kill -9 # courtine

# ------------------------------------------------------------------------------
function stop_start_tomcat(){
# ------------------------------------------------------------------------------
  ssh root@PRODATNV2WEB.mre.pub
  su - atnv2
  sh /var/atnv2/tomcat/bin/shutdown.sh        #  $CATALINA_HOME/bin/startup.sh
  # LOCAL :   # cd /etc/tomcat/current/
  ps -ef | grep tomcat | grep -v grep | awk '{print $4}' | xargs kill -9 # axel grep
  # VERIF et kill
  ps -ef | grep tomcat
  kill -9
  sh /var/atnv2/tomcat/bin/startup.sh
}




  # <plugin>
  #       <groupId>org.apache.maven.plugins</groupId>
  #       <artifactId>maven-antrun-plugin</artifactId>
  #       <configuration>
  #         <target>
  #           <!-- Transmission des propriétés Maven à Ant pour le déploiement. -->
  #           <property name="deploy.sshkeyfile" value="${deploy.sshkeyfile}" />
  #           <property name="tomcat.host" value="${tomcat.host}" />
  #           <property name="tomcat.user" value="${tomcat.user}" />
  #           <property name="tomcat.port" value="${tomcat.port}" />
  #           <property name="tomcat.catalina.base" value="${tomcat.catalina.base}" />
  #           <property name="tomcat.webapp.path" value="${tomcat.webapp.path}" />
  #
  #           <ant antfile="build.xml">
  #             <target name="deploy" />
  #           </ant>
  #         </target>
  #       </configuration>
  #
  #
  #       root   /var/atnv2/gwt/atnv2;
        # root   /var/atn/frontend/atnv2;


# /opt/java/current/bin/java
# -Djaxb.debug=true
# -Dmaven.home=/home/axel/dev/maven-3.1.0
# -Dclassworlds.conf=/home/axel/dev/maven-3.1.0/bin/m2.conf
# -Didea.launcher.port=7532
# -Didea.launcher.bin.path=/home/axel/dev/idea-13/bin
# -Dfile.encoding=UTF-8
# -classpath /home/axel/dev/maven-3.1.0/boot/plexus-classworlds-2.4.2.jar:/home/axel/dev/idea-13/lib/idea_rt.jar com.intellij.rt.execution.application.AppMain org.codehaus.classworlds.Launcher
# -Didea.version=13.1.6
# -DskipTests=true jetty:run-exploded
# -P localhost,Atnv2_Local,resources-dev,gwt-dev



 # /opt/java/current/bin/java
 #    -Djava.util.logging.config.file=/var/atnv2/tomcat/conf/logging.properties
 #    -Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager
 #    -Xms512m -Xmx1024m
 #    -XX:MaxPermSize=512m
 #    -Djava.awt.headless=true
 #    -XX:+UseConcMarkSweepGC
 #    -Dcom.sun.management.jmxremote.authenticate=true
 #    -Dcom.sun.management.jmxremote.password.file=/var/atnv2/tomcat/conf/jmxremote.password
 #    -Dcom.sun.management.jmxremote.access.file=/var/atnv2/tomcat/conf/jmxremote.access
 #    -Dcom.sun.management.jmxremote.ssl=false -Djava.endorsed.dirs=/opt/tomcat/current/endorsed
 #    -classpath /opt/tomcat/current/bin/bootstrap.jar:/opt/tomcat/current/bin/tomcat-juli.jar
 #    -Dcatalina.base=/var/atnv2/tomcat
 #    -Dcatalina.home=/opt/tomcat/current
 #    -Djava.io.tmpdir=/var/atnv2/tomcat/temp
 #    org.apache.catalina.startup.Bootstrap
 #    start




#    <!-- Tomcat -->
# (standard input)-79-        <tomcat.host>10.196.164.15</tomcat.host>
# (standard input)-80-        <tomcat.user>atnv2</tomcat.user>
# (standard input)-81-        <tomcat.port>9080</tomcat.port>
# (standard input)-82-        <tomcat.catalina.base>/var/atnv2/tomcat</tomcat.catalina.base>
# (standard input)-83-        <tomcat.webapp.path>ROOT</tomcat.webapp.path>
#    <!-- Tomcat -->
# (standard input)-79-        <tomcat.host>10.196.164.15</tomcat.host>
# (standard input)-80-        <tomcat.user>atnv2</tomcat.user>
# (standard input)-81-        <tomcat.port>9080</tomcat.port>
# (standard input)-82-        <tomcat.catalina.base>/var/atnv2/tomcat</tomcat.catalina.base>
# (standard input)-83-        <tomcat.webapp.path>ROOT</tomcat.webapp.path>


# [atnv2@preprodatnv2web conf.d]$   sh /var/atnv2/tomcat/bin/shutdown.sh
# Using CATALINA_BASE:   /var/atnv2/tomcat
# Using CATALINA_HOME:   /opt/tomcat/current
# Using CATALINA_TMPDIR: /var/atnv2/tomcat/temp
# Using JRE_HOME:        /opt/java/current
# Using CLASSPATH:       /opt/tomcat/current/bin/bootstrap.jar:/opt/tomcat/current/bin/tomcat-juli.jar
# Using CATALINA_PID:    /var/atnv2/tomcat/atnv2.pid
# [atnv2@preprodatnv2web conf.d]$   sh /var/atnv2/tomcat/bin/shutdown.sh
# Using CATALINA_BASE:   /var/atnv2/tomcat
# Using CATALINA_HOME:   /opt/tomcat/current
# Using CATALINA_TMPDIR: /var/atnv2/tomcat/temp
# Using JRE_HOME:        /opt/java/current
# Using CLASSPATH:       /opt/tomcat/current/bin/bootstrap.jar:/opt/tomcat/current/bin/tomcat-juli.jar
# Using CATALINA_PID:    /var/atnv2/tomcat/atnv2.pid



################################################################################
# DEBUG ERREURS
################################################################################

# ------------------------------------------------------------------------------
# NGINX
# ------------------------------------------------------------------------------
# 502 - BAD Gateway    >   mettre la conf : /etc/nginx/conf.d/default.conf (fichier a rajouter QUI est un lien symbolic sur "")
#                      >   il n avait m pas le fichier de conf
#                      >   ou alors recement, apres un deploy, il faut changer le path dans default.conf a : /atnv2 au lieu de /atn
# ------------------------------------------------------------------------------
# 404 -                >   not found (le client va demander une page qui n a pas ete trouve : normal) ==> on a du corriger l url av
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
#                                  vi etc/nginx/conf.d/atn ET CHANGE :
# BUG ACTUEL (NGINX)         >   le fichier met : /var/atn/frontend/atnv2;   ----------
#                                    au lieu de : /var/atnv2/gwt/atnv2;      ++++++++++
# REPONSE : cete variable est dans le fichier maven actuel
# 22595 - cf. redmine
# ------------------------------------------------------------------------------





# ----------------------------------------
# NGINX
# ----------------------------------------
# Pointe source FRONT : pointe sur les fichiers et pas le server
# - mettre ; au bout
# - change en allant dans le rep
#
# ATTENTION : SI LA PAGE NE CAHRGE PAS : /etc/nginx/sites-available/default (rajoute un numero de version)
#
# back : java 8 : port 9090
# front: java 7 : 8888 (ou open browser 8080)
# GXT explorer demo
