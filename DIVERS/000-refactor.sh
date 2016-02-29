
#!/bin/bash


----------------

org.springframework.stereotype
@java.lang.annotation.Target({java.lang.annotation.ElementType.TYPE}) @java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME) @java.lang.annotation.Documented @org.springframework.stereotype.Component public interface Service
extends java.lang.annotation.Annotation
Indicates that an annotated class is a "Service", originally defined by Domain-Driven Design (Evans, 2003) as "an operation offered as an interface that stands alone in the model, with no encapsulated state."
May also indicate that a class is a "Business Service Facade" (in the Core J2EE patterns sense), or something similar. This annotation is a general-purpose stereotype and individual teams may narrow their semantics and use as appropriate.
This annotation serves as a specialization of @Component, allowing for implementation classes to be autodetected through classpath scanning.

----------------
https://plus.google.com/117701628457363878515/posts/UxGnrGjniCA
https://www.drupal.org/node/172169
All JavaScript code MUST be declared inside a closure wrapping the whole file and this closure MUST be in strict mode.

// CLOSURE DEFINITION
var variable = "globale";
function fonctionParente() {
var variable = "locale";
function fonctionFille() {
print(variable);
}
return fonctionFille;
}
var fille = fonctionParente();
fille();
fonctionParente renvoie sa fonction interne et le code en bas de appelle cette fonction. Même si fonctionParente a fini de s’exécuter à ce moment-là, l’environnement local dans lequel variable a la valeur locale existe toujours, et fonctionFille continue de l’utiliser. Ce phénomène s’appelle une fermeture lexicale (ou closure en anglais).

----------------

inject = appel ce constructor

----------------

public class Operator
{
string operation;
public int Execute(int x, int y)
{
switch(operation)
{
case "Add":
return x + y;
case "Subtract":
return x - y;
case "Multiply":
return x * y;
case "Divide":
return x / y;
default:
throw new InvalidOperationException("Unsupported operation");
}
}
}
you'd have:
public abstract class Operator
{
public abstract int Execute(int x, int y);
}
public class Add : Operator
{
public override int Execute(int x, int y)
{
return x + y;
}
}
// etcpublic class Operator
{
string operation;
public int Execute(int x, int y)
{
switch(operation)
{
case "Add":
return x + y;
case "Subtract":
return x - y;
case "Multiply":
return x * y;
case "Divide":
return x / y;
default:
throw new InvalidOperationException("Unsupported operation");
}
}
}
you'd have:
public abstract class Operator
{
public abstract int Execute(int x, int y);
}
public class Add : Operator
{
public override int Execute(int x, int y)
{
return x + y;
}
}
// etc


--------------------
























# savoir les DNS
# nmcli dev list iface eth0 | grep IP4

# cat /etc/issue


################################################################################
# SCP
################################################################################

# (-p = date     -r = recursif)
# GET  = scp FILE DEST_HOST:dossier  > scp error.log  axel@10.196.165.188:/home/axel/error.log
# POST = scp DEST_HOST:dossier FILE

# - je vois dans DEPLOY :
clean process-resources -P ${ENVIRONNEMENT}
# - mais je change avec :
clean package -DskipTests=true -P atnv2_production


# repertoire conf port TOMCAT
/var/atnv2/tomcat/conf/server.xml


# INSTALLATION PKG
sudo dpkg --install


# ------------------------------------------------------------------------------
# ficher DNS (/etc/hosts pour les hosts)
# --------------------------------------------
 /etc/resolvconf/resolv.conf.d/base
 sudo resolvconf -u (marche pas donc ci desosus)
 sudo ifdown -a and then sudo ifup -a
 nameserver 10.196.164.231

# ---------------------------
# mettre a jour
 df -h
 df -k
# ---------------------------

# ALT + SUPPR -

# ------------------------------------------------------------------------------
# REGLE : LORSQUE TU CHERRY PICK : IL FAUT ABSOLUEMENT QUE TU METTES :
# PICK (avec la coloration syntaxique : sinon tu ne comprend plus rien)
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# APRES MEP - DEPLOY
# ------------------------------------------------------------------------------
# http://xwiki.mre.pub/bin/view/Portail+Appli+Mediavision/Adresses+des+Applications#HI.2-ATN
# > 1.2 - Date de livraison	 	01/12/2015	11/10/2015
#
# et journal : http://xwiki.mre.pub/bin/edit/Portail+Appli+Mediavision/Journal+de+Production+ATN+2015





# ------------------------------------------------------------------------------
# MAN grep
# -E use extended regex;
# -o output only the matched text instead of the full line)
# ------------------------------------------------------------------------------
# ASTUCE : comme cela je sais les fichiers qui sont lies
alias now="gs f3c8275 | grepc 'getfilter|diff \-\-' | h -ni '\.java|src/main/java/com/groupemre/atnv2/'"

# refaire pour mettre jsute le nom du fichier
# gs f3c8275 | grep 'getfilter|diff \-\-' | h -ni '([^/.*\.java]|)+$'
# ------------------------------------------------------------------------------


# AXEL - c'est TROP restrictif
# alias grepc='grep --color=always';
# alias grepa='grep -HEin --color=always';







# OK - super - me donne de bons resultats (juste le nom du fichier apres le /)
# gs f3c8275 | grep 'diff \-\-'
# gs f3c8275 | grep 'diff \-\-' | grep '([^/]|)+$'
# gs f3c8275 | grep 'diff \-\-' | grep -o '([^/]|)+$' (que le nom)

# gs f3c8275 | grep 'diff \-\-.*([^/]|)+$'

# gs f3c8275 | grep 'diff \-\-' | grep -o '([^/]|)+$' (que le nom)
# gs f3c8275 | sed 's/diff \-\- //g'
# gs f3c8275 | sed 's/.* //g'

# gs f3c8275 | grep -v '[^\-]'







# modifier en local ce qui change a chaque fois
alias nnginx='vi /etc/nginx/sites-enabled/default'
alias nnginxR='sudo service nginx restart'


#
# transporteur actif  >> Mise à disposition sur clef USB
#


# // WIKI : TODO
# - procedure de test des ftp
# - procedure de test des WS
# - procedure de test des fonctionnalites de base

# ------------------------------------------------------------------------------
# PROBLEMES ATN A CORRIGER
# ------------------------------------------------------------------------------
# PB : Le DCP 2360 n'est pas valide.Le DCP 2360 n'est pas valide.
# SOL : Il faut que tu mettes le complexe sur les 2 transporteurs


# ------------------------------------------------------------------------------
# ALL SETTINGS
# ------------------------------------------------------------------------------
# [DEBUG] Reading global settings from /var/lib/jenkins/tools/hudson.tasks.Maven_MavenInstallation/3.0.4/conf/settings.xml
# [DEBUG] Reading user settings from /var/lib/jenkins/.m2/settings-atnv2.xml
# [DEBUG] Using local repository at /var/lib/jenkins/.m2/repository
# [DEBUG] Using manager EnhancedLocalRepositoryManager with priority 10 for /var/lib/jenkins/.m2/repository
# ------------------------------------------------------------------------------



# Echec du rapatriement du fichier de log. Passage au fichier suivant


# ------------------------------------------------------------------------------
# CAS A DEBUG
# ------------------------------------------------------------------------------
# SI TU AS UN PROBLEME SUR LE FTP, voila il arrive pas a se connecter a cause PWD
# 2015-12-10 15:55:25,300 -import_QuartzSchedulerThread - ERROR - [] - c.g.a.m.u.ClientFtp - 252 - Le router smartjog ne peut pas s'identifier au client FTP. L'upload n'a pu avoir lieu2015-12-10 15:55:25,300 -import_QuartzSchedulerThread - ERROR - [] - c.g.a.m.u.ClientFtp - 252 - Le router smartjog ne peut pas s'identifier au client FTP. L'upload n'a pu avoir lieu
# ------------------------------------------------------------------------------



###############################################################################
# VERIF TECHNIQUE
################################################################################
# 1 - on/off hibernate log = tu le fait dans ton settings.xml et tu redemarres (juste le jetty exploded)
# 2 - hot deploy = tu active dans le fichier backend/pom.xml (line  <scanIntervalSeconds>2</scanIntervalSeconds>)
# -----> et puis : CTRL + SHIFT + F9 (> compile juste le fichier qui a change)
# 3 - avant de faire envoie en masse, verifier que le COMPLEXE a le statut : ' Mise à disposition sur clef USB'

################################################################################
# VERIF FONCTIONNEL
################################################################################
# 1 - verif : WS ok = faire un getCataloque
# 2 - verif : le complexe est dispo ( Autre ref > list cpx > regarder ETAT RESEAU (doit etre disponible pour le cpx))
# 3 - verif : gestion des DCPS > liste des DCP > verifid en BASE booleen a TRUE pour CATALOGUE smart et globecast
# -----> je traduis les DCP doivent etre dans le catalogue smart et globecast (a faire tous les matins)


# TODO - donner le user axel pour qu'il ait le droit d'executer sur la db
alias gobd='su postgres && psql -f /home/axel/alias/PGSQL/JDD.sql atn'
