//##############################################################################
# 
#                                   BEST NOTES DEV
# 
##############################################################################//

################################################################################
# o
################################################################################
:parsing technique
fonction pgslql = donne tableau et rend le reste

################################################################################
# 
################################################################################
Laa = AOP = il fait une fonction qui reccupere a l execution l appel de la methode et il fait un traitement dessus
-------------------------
demande Arnaud / Laa la difference javawildcard

public abstract class EditorWithDriver<T> extends Composite implements Editor<T>, ValueAwareEditor<T> {

public interface SimpleBeanEditorDriver<T, E extends Editor<? super T>> extends EditorDriver<T> {

################################################################################
# 
################################################################################
difference wildcard ? et object AND why serializable does not extend Object

################################################################################
# 
################################################################################
41-snapshot ==> release TAG 41 (et next est 42-snapshot)
snapshot = la version sur laquelle je travaille actuellement

################################################################################
# 
################################################################################
KILL TOMCAT
ps -ef | grep tomcat | grep -v grep | awk '{print $2}' | xargs kill -9

################################################################################
# 
################################################################################
smartgit - supprime le .smartgit dans ton REP et relance

################################################################################
# 
################################################################################
HASH CODE ET AUTRES
couper en token avec StringTokenizer
  StringTokenizer strTk1 = new StringTokenizer(tmpStr, "&", false);

################################################################################
# 
################################################################################
/* LOGGER STYLE */

LOGGER.info(
            String.format(
                    "RAPATRIEMENT du fichier de log de diffusion dans le fichier TEMPORAIRE %s ",
                    tempFile.getAbsolutePath()
            ));
LINE LOGGER - logger.error("Error while calculating next term for subscription n°{}", dbSubcription.getId() , e);

################################################################################
# 
################################################################################
git reflog ?

################################################################################
# 
################################################################################
- MARSHALL / SPRING MVC
- SQL
- HIBERNATE

################################################################################
# 
################################################################################
avec l annotation SPRING pour transaction hibernate (@transac) au niveau du WS

################################################################################
# 
################################################################################
- SPRING TRANSAC + SPRING WS (java 8) ---> sur cloud ?

mag : mag_id
prod : mag_id + pdt_id
-- liste des magasins qui ont au moins 10 produits differents :
select 
group by produit
having count (....)
// 2 solutions (soit requete imbriquee, soit having)

HIBER - LazyLoading vs Eager Loading
isl prefernt lazy ==> eager peut etre grave

session (navigateur ou server) VS localstorage

map, treemap, qd est ce qu on a besoin d une hashmap etc ???

deployer sur un server TOMCAT = la base

PB - post + refresh ou back
https://en.wikipedia.org/wiki/Post/Redirect/Get

proxy and delegate

elastic search - index de donnees des produits (comprendre)elastic search - index de donnees des produits (comprendre)


################################################################################
# 
################################################################################
serialise (java -> JSON / GET) ET deserialise (JSON -> java / SET)

difference release ET version applcatif
versions appli avec version releases DCOM - 8.5.1 - version appliaction ?
num version sur appli qui match avec release globale= pas de sen
il vaut mieux tag 8.4.b, 8.4.b
correller appli avec release globale (sait ce que l on va livrer)
 
num de version dans le TAG

La version de resolution = la version sur laquelle tu travailles (vesion cible est l arrivee supoposee ?)

################################################################################
# 
################################################################################
