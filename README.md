crypto20min
===========

* Une présentation de 20 minutes
* Introduction à la cryptographie
* Slides rédigés en reSt
* Convertis avec Hovercraft en HTML pour impress.js
* Un travail écrit accompagnant la présentation
    * Le travail écrit est également rédigé en reSt

Pré requis pour le travail écrit
--------------------------------

* Programme wget pour télécharger les images
* Programmes pandoc ou rst2latex pour générer les documents
* Programme evince pour visualiser les pdf
* Programme make pour faciliter la génération

Exemple d'installation des pré requis sous une distribution à base de Debian:

    apt-get install pandoc python-docutils wget evince make

Génération du travail écrit
---------------------------

Pour générer le travail, commencer par télécharger les images en Creative Commons:

    make images

ensuite, pour générer un fichier pdf avec rst2latex:

    make

Sinon, pour générer un pdf avec pandoc:

    make pandoc

Pour générer un fichier .odt pour Libre Office:

    make odt

Pour générer un docx pour MS Office:

    make docx
