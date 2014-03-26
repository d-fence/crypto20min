.. target-notes::

La cryptologie
==============

Définitions
-----------

* Cryptologie : Science du secret
* Cryptographie : L'art des écritures cachées
* Cryptanalyse : L'art de rendre clair un texte chiffré
* Stéganographie : L'art de la dissimulation

Il est important de donner ici encore quelques définitions afin d'essayer de 
diminuer la confusion entre les termes utilisés. De plus certains termes
entendu proviennent directement de l'anglais, comme "encryption".

* Chiffrement: 
    procédé par lequel on rend un message inintelligible pour ceux qui n'ont
    pas le code nécessaire pour le déchiffrement
* Décryptage:
    procédé de déchiffrement sans connaître la clef de chiffrement.
* Le chiffre :
    c'est la méthode de chiffrement ou l'organisme qui s'occupe de chiffrer

Il est donc préfréable d'utiliser le verbe "chiffrer" plutôt que "crypter" ou
pire encore "encrypter". Par contre décrypter peut convenir lorsque l'on 
déchiffre un message sans en possèder la clef.

Historique
----------

Le besoin de réaliser des communications sécurisées, cachées, secrètes, 
remonte à la nuit des temps.

On a retrouvé des hiéroglyphes datés de 4000 ans, "transformés" pour les 
rendre inintelligibles.

Nabuchodonosor en 600 avant JC écrivait sur le crâne rasé des esclaves.
Il fallait alors attendre la repousse des cheveux pour cacher le message.
Ceci s'apparente donc à de la stéganographie.

Les guerriers spartiates ont utilisés la Scytale_. Il s'agît d'un ruban
enroulé autour d'un cylindre sur lequel on inscrit le message.
Une fois le ruban enlevé du cylindre, il est difficile de lire le message.
Celui qui possède le cylindre ou un autre cylindre de même diamètre,
peut déchiffrer le message. Le cylindre est donc la clef de chiffrement.

Une methode de cryptanalyse de la Scytale consisterait à essayer des
cylindres de différents diamètres afin décrypter le message.

.. _Scytale : https://fr.wikipedia.org/wiki/Scytale

Les hébreux ont utilisés le chiffre Atbash_. Il consiste à faire
correspondre l'alphabet avec lui même en ordre inverse

Voici un tableau pour l'alphabet latin:

+-+-+-+-+-+-+-+-+-+-+-+-+-+
|A|B|C|D|E|F|G|H|I|J|K|L|M|
+-+-+-+-+-+-+-+-+-+-+-+-+-+
|Z|Y|X|W|V|U|T|S|R|Q|P|O|N|
+-+-+-+-+-+-+-+-+-+-+-+-+-+

Pour déchiffrer, il suffit de recoder le message codé.

.. _Atbash : https://fr.wikipedia.org/wiki/Atbash

En 200 avant JC, les romains ont utilisé le chiffre de César.
Il s'agissait d'une simple substitution qui consistait à décaler
l'alphabet d'un certain nombre de places.
La clef de chiffrement était donc ce nombre.

Comme l'alphabet latin ne contient que 26 lettres, cette clef n'a
donc que 25 positions possibles.

Lorsque l'on utilise le code de César avec la clef 13, ce code peut aussi
porter le nom plus moderne de ROT13.


Le chiffre de Vigenère

Le télégramme de la victoire

Enigma

Colossus


