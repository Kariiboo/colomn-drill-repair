# Support de butée de profondeur pour perceuse à colonne

## Présentation

Ma perceuse à colonne [FARtools P13E engine](http://www.perceuse-colonne.info/perceuse-a-colonne-fartools-one-p-13e/) a une butée de profondeur métalique. Elle est fixée sur un support en plasique.
Le plastique est moins résistant que le métal et va casser tôt ou tard. C'est fait.

J'ai envisagé plusieurs possibilité pour réparer:

- Recoller le morceau cassé sur le support :
    J'ai essayé... mais pas comme il aurait fallu et ça n'a pas tenu... J'ai coller encore. C'est moche, mais ça tient pour le moment. Il faudra vite une autre solution.
- Racheter un support :
    Après tout, ce n'est qu'un bout de plastique. Mais il faut commander le support, le carter de protection, deux ressorts et des boulons. Le tout pour un peu plus de 22€ [ici](http://www.worken.fr/p/120/Perceuse-a-colonne/Protection-De-Mandrin-De-Rechange-Pour-AC13TP) (12,50€ + le port). C'est acceptable, mais c'est un peu domage de commander tout ça. Et en plus, ça recassera un jour.

- Refaire un support en plastique avec une imprimante 3D :
    Modéliser et imprimer uniquement la partie abimée. Et en imprimer une autre quand elle cassera à nouveau. L'idée est belle.

## Matériel

- Il faudra utiliser une imprimante 3D. Il y en a au FabLab !

## Modélisation

La première idée a été d'utiliser le logiciel [SketchUp](https://www.sketchup.com) car il est assez intuitif. Il existe maintenant une [version gratuite en ligne](https://app.sketchup.com/app). La section 3.2 des [conditions d'utilisations](https://app.sketchup.com/tos.html) me conduit à chercher un autre outil.

Après une discussion avec Jérôme, ce sera finalement [OpenScad](www.openscad.org). Un logiciel libre qui se prend en main assez facilement grâce au [tutoriel sur le wiki du FabLab](https://wiki.fablab-lannion.org/index.php?title=OpenSCAD) !

Après avoir réalisé une première version du modèle 3D, je fais une vérification des dimensions. N'ayant pas trouvé d'outil de mesure dans OpenScad, j'exporte en format STL. J'importe ce fichier dans une ancienne version de Sketchup, et j'utilise l'outil de mesure de Sketchup. Cette vérification met en évidence une erreur d'échelle : la pièce est deux fois trop grande !

Une fois l'erreur corrigée, je peux imprimer. Mais avant, on regarde le modèle avec Manu qui me fait quelques remarques judicieuses. En particulier celle-ci: une partie du support original n'est pas utilisée. En la supprimant on gagnera en temps d'impression et en plastique. Bien vu !

Au final ça donne ça : ![OpenSCAD 3D model](safetyCoverSupport.png)
Le source du fichier OpenScad est disponible sur GitHub 

    <REFERENCE GITHUB>

## Impression 3D

Les étapes de l'impression, avec l'aide des personnes du FabLab:
- Export STL
- Import dans l'outil pour faire le "tranchage" et export du fichier vers le logiciel d'impression
- Impression

Une fois le support imprimé, je constate que les écrous ne rentrent pas dans les emplacements prévus. En discutant, une solution est trouvée pour utiliser quand même la pièce imprimée (merci Bernard) : en chauffant un peu les écrous on devrait pouvoir les rentrer en force dans les emplacements ! Et ça le fait ! Encore bien vu !
J'ai tout de même agrandi les emplacements des écrous sur le modèle 3D pour les impressions futures !

## Conclusion

L'impression de la pièce en plastique ABS prend environ 2 heures, et il faut compter un peu plus de 5€.
Impossible de compter le temps passé sur ce projet, mais qu'importe au regard des apprentissages et des discussions générées.
C'est une belle aventure que de réparer de cette manière. Et le jour ou ce support cassera à nouveau, pas d'hésitation j'en imprime un autre.

## Evolutions possibles

Pourquoi pas : ajouter un éclairage dans ce support : 3 LEDs (3, pour limiter les ombres), une pile et un interrupteur.

## Bibliographie

- Une perceuse à colonne [FARtools P13E engine](http://www.perceuse-colonne.info/perceuse-a-colonne-fartools-one-p-13e/)

- [Protection de mandrin de rechange pour AC13TP](http://www.worken.fr/p/120/Perceuse-a-colonne/Protection-De-Mandrin-De-Rechange-Pour-AC13TP)

- Logiciel libre de modélisation paramétrique [OpenScad](www.openscad.org)

- [Tutoriel OpenScad - FabLab Lannion](https://wiki.fablab-lannion.org/index.php?title=OpenSCAD)

- A propos de la dimension des écrous: https://fr.wikipedia.org/wiki/%C3%89crou_hexagonal
