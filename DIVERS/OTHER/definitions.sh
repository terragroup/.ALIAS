################################################################################
# SPring
################################################################################
org.springframework.stereotype
@java.lang.annotation.Target({java.lang.annotation.ElementType.TYPE}) @java.lang.annotation.Retention(java.lang.annotation.RetentionPolicy.RUNTIME) @java.lang.annotation.Documented @org.springframework.stereotype.Component public interface Service
extends java.lang.annotation.Annotation
Indicates that an annotated class is a "Service", originally defined by Domain-Driven Design (Evans, 2003) as "an operation offered as an interface that stands alone in the model, with no encapsulated state."
May also indicate that a class is a "Business Service Facade" (in the Core J2EE patterns sense), or something similar. This annotation is a general-purpose stereotype and individual teams may narrow their semantics and use as appropriate.
This annotation serves as a specialization of @Component, allowing for implementation classes to be autodetected through classpath scanning.

################################################################################
#
################################################################################

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


################################################################################
# EXPERT LEVEL
################################################################################

- Notions:
Le consultant a fait de la veille sur le sujet ou a bénéficié d'une formation mais n'a pas mis en pratique.

- Pratique:
Le consultant a travaillé quelques semaines sur le sujet (dans sa vie professionnelle ou projet personnel).
Il a une première expérience assez simple mais peut manquer d'une vision d'ensemble.

- Maîtrise:
Le consultant a travaillé de manière approfondie dans des contextes différents.
Il est capable de préparer et/ou animer une soirée 3T sur tout ou partie du domaine.

- Expert:
A ce niveau le consultant a également une bonne compréhension et peut débattre sur de nombreux choix associés à la compétence.
Il peut assurer des formations internes / externes.

- Super Expert:
Le consultant peut assurer des conférences publiques sur ce sujet.
Il est crédible, reconnu par ses pairs et difficilement critiquable.

################################################################################
#
################################################################################
