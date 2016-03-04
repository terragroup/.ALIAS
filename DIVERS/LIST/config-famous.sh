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
