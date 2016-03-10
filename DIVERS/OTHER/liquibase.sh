################################################################################
# VAR
################################################################################

# attention a commenter les clefs des index : car H2  ne prend pas en compte les clefs

#-------------------------------------------------------------------------------
# Pour lancer le liquibase
#-------------------------------------------------------------------------------
# mettre le profil MAVEN sur:
-  LOCALHOST
-  APPLY-DB-MIGRATION
# puis maven (partie DB)
-  clean
-  install

#-------------------------------------------------------------------------------
#
#-------------------------------------------------------------------------------

UPDATE DATABASECHANGELOGLOCK
SET locked=0, lockgranted=null, lockedby=null
WHERE id=1

#-------------------------------------------------------------------------------
#
#-------------------------------------------------------------------------------

runOnChange=true
liquibase : tu me joue tout et prend les checksum
# wiki a rajouter
# liquid car jenkins sait la machine
        <profile>
                <id>dev-AREGNOULT</id>
                <properties>
                       <db.driver>com.mysql.jdbc.Driver</db.driver>
                       <db.jdbc>jdbc:mysql://axel-HP-Compaq-8200-Elite-SFF-PC:3306/medicisdb</db.jdbc>
                       <db.user>admin</db.user>
                       <db.password>adm1n</db.password>
                </properties>
        </profile>


#-------------------------------------------------------------------------------
# coutaumille.xml
#-------------------------------------------------------------------------------
# si rien, il fait sur tous, mais la on a
# besoin que sur H2
  <preConditions onFail="MARK_RAN">
            <dbms type="h2"/>
        </preConditions>
# en suppression : pas besoin car la table exite deja

#-------------------------------------------------------------------------------
# comment faire si tu veux changer un change que tu n'as pas le droit
#-------------------------------------------------------------------------------
tu supprimes la ligne dans datachangebaselog
