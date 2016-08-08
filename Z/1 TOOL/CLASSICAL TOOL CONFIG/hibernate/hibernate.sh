################################################################################
#  HIBERNATE - LOGGER
################################################################################

# FICHIER : settings.xml
# 1 - on/off hibernate log = tu le fait dans ton settings.xml et tu redemarres (juste le jetty exploded)
<hibernate.showsql>false</hibernate.showsql>

# FICHIER :  persistence.xml
<property name="hibernate.format_sql" value="false"/>
<property name="hibernate.use_sql_comments" value="false"/>

# FICHIER : logback.xml
<!--HIBERNATE - DEBUG PARAMETRES REQUETES -->
<logger name="org.hibernate.type" level="ALL" />
<logger name="org.hibernate" level="DEBUG" />




# ------------------------------------------------------------------------------
# run ATN                      :     BACK-END + FRONT-END + SUPER-DEV MODE (mvn jetty:run-exploded)
# ------------------------------------------------------------------------------
APPLICATION (AXL_IP base)  :     MEDICIS :       hibernate.cfg.xml
                                                 context.xml
                                                 application.properties

                                   ATN     :     config de la database sont dans MAVEN (+ regarde dans context.xml, il a import les variables)
                                                 applicationContext.xml (les job et autres)
