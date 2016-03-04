# --------------------------------------------
# ATN - LOGGER
# --------------------------------------------
ATN LOGGER
- logback.xml = fichier de log

config hibernate (show)
- ==> dans le XML (settings.xml)

#  Toutes les conf HIBERNATE

# settings.xml
<hibernate.showsql>false</hibernate.showsql>

# persistence.xml
<property name="hibernate.format_sql" value="false"/>
<property name="hibernate.use_sql_comments" value="false"/>

# logback.xml
<!--HIBERNATE - DEBUG PARAMETRES REQUETES -->
<!--<logger name="org.hibernate.type" level="ALL" />-->
<!--<logger name="org.hibernate" level="DEBUG" />-->


# ------------------------------------------------------------------------------
# run ATN                      :     BACK-END + FRONT-END + SUPER-DEV MODE (mvn jetty:run-exploded)
# ------------------------------------------------------------------------------
APPLICATION (AXL_IP base)  :     MEDICIS :     hibernate.cfg.xml
                                                 context.xml
                                                 application.properties
                                   ATN     :     config de la database sont dans MAVEN (+ regarde dans context.xml, il a import les variables)
                                                 applicationContext.xml (les job et autres)



###############################################################################
# VERIF TECHNIQUE
################################################################################
# 1 - on/off hibernate log = tu le fait dans ton settings.xml et tu redemarres (juste le jetty exploded)
# 2 - hot deploy = tu active dans le fichier backend/pom.xml (line  <scanIntervalSeconds>2</scanIntervalSeconds>)
# -----> et puis : CTRL + SHIFT + F9 (> compile juste le fichier qui a change)
# 3 - avant de faire envoie en masse, verifier que le COMPLEXE a le statut : ' Mise à disposition sur clef USB'



 # repertoire conf port TOMCAT
 /var/atnv2/tomcat/conf/server.xml
