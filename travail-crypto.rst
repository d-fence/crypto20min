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

.. figure:: 640px-Skytale.png

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

Le chiffrement par substitution simple peut être déjoué par l'analyse de fréquence.

Le graphique suivant montre l'analyse de fréquences des lettres de l'alphabet latin/français dans deux romans:

.. image:: analyse.png

Ce graphique montre clairement que les même lettres sont utilisées en proportions quasi identiques. De ce fait, si on analyse les fréquences des lettres substituées, on peut reconstituer le mesage original. 

Le chiffre de Vigenère

Le cryptage par chiffrement de Viginère est un chiffrement dit poly-alphabetique contrairement au chiffrement de César.

Celui-ci est une évolution du code de césar, plus complexe à déchiffrer car il résiste mieux à l'analyse des fréquences.

Fonctionnement :

    * clef: IFOSUP
    * Message clair: 


Cryptanalyse:

Afin d'essayer de déchiffrer un chiffre poly-alphabetique, il convient de chercher des mots clef répétitifs (des "cribs").
Ces mots clef, si ils ont été chiffrés avec à différents endroits avec des mêmes morceaux de clef, vont permettre calculer la longueur de la clef.

Une fois que la longueur de la clef a été trouvée, on regroupe les lettres ayant été chiffrées avec le même morceau de clef. On procède alors à une analyse de fréquence classique sur ces groupes de lettres.

Le télégramme de la victoire

À la fin de la première guerre mondiale, les allemands chiffraient leurs message avec le chiffre "ADFGVX". Il s'agissait à la fois d'un chiffrement basé sur une substitution des lettres suivi d'un deuxième chiffrement constitué d'une transposition.

Un radiogramme chiffré par cette méthode a été intercepté par les alliés et déchiffré par Georges Painvin.

.. _Painvin : https://fr.wikipedia.org/wiki/Georges_Painvin

Ce message ordonnait l'envoi massif de munition à un endroit de la ligne de front, ce qui permit au alliés de concentrer leurs troupes à cet endroit.
Il est admit que ce déchiffrement à permis d'accélérer la fin des hostilité et peut-être même changer l'issue de la guerre !

Enigma

Colossus

Leçons de l'histoire
--------------------

En regardant la méthode Atbash, on constate que si l'opposant découvre la
méthode de chiffrement, il peut déchiffrer chaque message intercepté.  Il ne lui
reste qu'a garder secret le fait qu'il peut lire les messages.

Leçon:
    La méthode utilisée devrait pouvoir tomber au mains de l'opposant sans
    compromettre les messages.  En bref, la méthode devrait être publique.

Observons la Scytale, on comprend facilement que si ce cylindre est transporté
avec le message et qu'il est intercepté, l'opposant pourra déchiffrer chaque
message si le diamètre du cylindre n'est pas changé à chaque message.

Leçons:
    * La clef de chiffrement ne devrait jamais être transmise avec le message.
    * La clef de chiffrement devrait changer souvent (on verra plus tard
        qu'elle devrait changer à chaque message).

One Time Pad
------------

Bien qu'en matière de cryptologie il faille sa garder des certitudes, le "One
Time Pad" est considéré comme indéchiffrable.
Mais il faut pour cela qu'il soit bien employé avec les conditions suivantes
strictement respectées:

    * Le clef de chiffrement doit être aussi longue que le message.
    * La clef ne peut être utilisée qu'une et une seule fois.

Chiffrement informatique
========================

Types de chiffrement
--------------------

* Chiffrement symétrique:
    Comme la montré l'histoire, le chiffrement, jusqu'aux années 1970 était un
    chiffrement à clés symétriques. A savoir, l'émetteur et le récepteur du
    message devaient tous deux posséder une clef identique afin d'en déchiffrer le
    contenu.

* Chiffrement asymétrique:
    Vers 1976, Whitfield Diffie et Martin Hellman auraient été les premiers à
    présenter le concept de chiffrement asymétrique.
    Dans ce cas, le message est chiffré avec une clef particulière mais, il est
    déchiffré avec une clef différente.

Chiffrement asymétrique, concepts de clef publique et clef privée
-----------------------------------------------------------------

Il s'agît de chiffrer le message à l'aide d'une fonction qui difficilement
réversible et ayant une porte dérobée unique basée sur une information.

C'est l'information permettant de calculer la fonction dérobée qui constitue la
clef secrète. Par contre l'information utilisée comme paramètre de la fonction
de chiffrement constitue la clef publique.

La notion de difficilement réversible est important, c'est cette difficulté à
"renverser" l'algorithme qui permet de mesurer la valeur de la méthode utilisée.

Utilisations
============

Chiffrement XOR
---------------

Le cryptage Xor est un systeme de cryptage dit basique et symétrique, il à été très utilisé dans les débuts de l'informatique et l'est encore aujourd'hui car il est facile à intégré dans les programmes.

Ce système de chiffrement à été utilisé par les espions soviétiques et pour le téléphone rouge entre le kremlin et la maison blanche entre autres.

Rappel table de vérité du Xor :

+------+------+-----------------+
| A    | B    | **A** XOR **B** |
+======+======+=================+
| Faux | Faux | Faux            |
+------+------+-----------------+
| Faux | Vrai | Vrai            |
+------+------+-----------------+
| Vrai | Faux | Vrai            |
+------+------+-----------------+
| Vrai | Vrai | Faux            |
+------+------+-----------------+


+---------+----------+----------+----------+----------+----------+----------+----------+
| Lettres | M        | E        | S        | S        | A        | G        | E        |
+---------+----------+----------+----------+----------+----------+----------+----------+
| ASCII   | 77       | 69       | 83       | 83       | 65       | 71       | 69       |
+---------+----------+----------+----------+----------+----------+----------+----------+
| binaire | 01001101 | 01000101 | 01010011 | 01010011 | 01000001 | 01000111 | 01000101 |
+---------+----------+----------+----------+----------+----------+----------+----------+

+---------------------+----------+----------+----------+----------+----------+----------+----------+
| Message binaire     | 01001101 | 01000101 | 01010011 | 01010011 | 01000001 | 01000111 | 01000101 |
+---------------------+----------+----------+----------+----------+----------+----------+----------+
| Pattern Clé binaire | *None*   | *None*   | *None*   | *None*   | *None*   | *None*   | *None*   |
+---------------------+----------+----------+----------+----------+----------+----------+----------+
| Messagecrypté       | 00001110 | 00001001 | 00010110 | 00010000 | 00001101 | 00000010 | 00000110 |
+---------------------+----------+----------+----------+----------+----------+----------+----------+

Chiffrement de messages
-----------------------

Les logiciels les plus connus pour chiffrer des messages entre plusieurs
utilisateurs sont certainement PGP et GPG (Gnu Privarcy Guard). C'est ce
dernier qui sera utilisé pour illustrer les exemples du présent travail.
 
Principes
---------

Les utilisateurs qui veulent échanger des messages secrets doivent commencer
par générer une paire de clef priveé/publique. Cette paire de clef sera
généralement associée à une ou plusieurs adresses email.

En pratique, ces clef sont enregistrées dans des fichiers. Il est évident que
toute la sécurité repose sur l'entreposage de la clef privée.

Exemple de génération de paire avec GPG::

    gpg --gen-key

Il faut faire un choix d'algorithme de chiffrement et de longueur de clef.

Afin de protéger sa clef privée au maximum, il convient de la chiffrer et
d'utiliser une "passphrase" comme clef de chiffrement symétrique.

Il faudra ensuite protéger sa clef privée, même chiffrée contre la lecture.
Au besoin, il est possible de stocker sa clef privée sur un périphérique externe
qui ne sera connecté que le temps de son utilisation.

Vient alors le moment d'échanger sa clef publique avec la ou les personnes avec
qui l'on désire communiquer.

Il faut ici faire une remarque très importante car ce point est très souvent
négligé:
Le système est entièrement basé sur la confiance, c'est pourquoi il ne faut
accepter des clef publiques que lorsque l'on a pu vérifier son interlocuteur.

En effet, une méthode d'attaque de ce procédé consiste à se faire passer pour
une personne de confiance et ainsi recevoir des messages qui lui sont destinés.

Exemple::

    Eve envoie un mail à Bob en se faisant passer pour Alice. Elle donne sa
    clef publique à Bob, associée à une adresse mail qu'elle contrôle.
    Bob envoie alors des messages chiffrés pensant qu'ils arrivent chez Alice,
    ils sont en réalité chiffrés pour Eve et envoyés à Eve.

Les solutions à ce problème sont de plusieurs natures:
    1. N'accepter des clefs publiques uniquement de visu
    2. Établir un système de confiance en signant les clefs publiques des personnes
        dont on a pu établir l'identité formellement.

Key Signing Parties:
    Lors de certains rassemblement, des personnes se rassemblent et vérifient
    leurs clefs publiques les uns et les autres sur base de la présentation d'un
    document d'identité et d'une empreinte cryptographique de la clef publique.
    Les clefs sont signées par la suite sur base de l'empreinte.

.. figure:: 319px-FOSDEM_2008_Key_signing_party.jpg
    :alt: Author Stevenfruitsmaak


Pour chifrrer un message, il faut possèder la clef publique des destinataires.
Une propriété intéressante est que l'on peut chiffrer un message avec plusieurs
clés publiques. Chaque destinataire pourra alors déchiffrer le message.
Si l'auteur du message ne le chiffre pas avec sa clef propre clé publique, il
ne pourra pas déchiffrer son propre message. Le fait de garder une copie du
message original en clair peut aussi constituer une faille dans le procédé.

Exemple de chiffrement avec clef publique::

    gpg -a -e message.txt

    l'argument "-a" permet "d'armer" le fichier chiffré (il est alors en ascii, transférable par mail)
    l'argument "-e" demande à GPG de chiffer le message

    GPG demande ensuite les destinataires dont on doit possèder la clef publique.

On peut également utiliser GPG pour signer des messages ou des documents. La
signature permet de vérifier que le fichier a bien été signé par le possesseur
de la clé et que ce fcihier n'a pas été modifié depuis la signature.

Exemple de signature et vérification d'un document::

    gpg -a -b document.pdf

    l'argument "-a" permet de génerer une signature "armée" (ascii)
    l'argument "-b" permet de générer une signature détachée du document original

    Un fichier "document.pdf.asc" est produit, il contient la signature.
    Pour vérifier ce document:

    gpg --verify document.pdf.asc document.pdf

    Si un seul bit été changé dans le document, il sera invalidé.

On voit donc que cette signature permet les fonctionalités suivantes:

    * Vérifier l'intégrité du message.
    * Vérifier l'origine présumée du message.
    * Vérifier l'authenticité du message.

Le système de signatures cryptographiques GPG est largement utilisé par les
distributions linux afin de signer les logiciel binaires distribués. De cette
manière, le risque de propagation de virus et de chevaux de troie et largement
diminué.

Malheureusement, force est de constater que ce système de chiffrement est
surtout utilisé par des informatitciens. On peut facilement en imaginer les
raisons:

    * Les utilisateurs lambda ne resentent pas l'utilité de chiffrer leurs communications.
    * La gestion du trousseau nécessite une certaine rigueur peu encouragée par
        les multiples réinstallations nécessaires de systèmes comme MS Windows.
    * Il faut que toutes les parties adhèrent à ce système, si un seul
        participant à une communication demande de reçevoir le message en clair, le
        système est mis à mal.


Chiffrement de communications en temps réél
-------------------------------------------

Principes
---------

Comme le chiffrement asymétrique est très lent, il est difficile de l'utiliser
pour chiffrer des flux de données en temps réél.  Pour cette raison, la plupart
du temps, le chiffrement asymétrique sera utilisé pour échanger une clef de
chiffrement symétrique (souvent appelée clé de session) qui servira à chiffrer
la communication uniquement pour le temps de l'échange.

ssh
---

Ssh (Secure Shell) permet de remplacer aventageusement telnet dont les
communications n'éateient pas chiffrées. Il permet, entre autres, de se
connecter en mode terminal à un ordinateur distant.

On peut l'utiliser avec un simple mot de passe, ce mot de passe est vérifié par
la machine distante et lorsque la vérification est positive, une clé symétrique
est générée pour chiffrer la communication.

Il est préférable d'utiliser plutôt une paire de clef. La clé privée sera
gardée précieusement sur la machine initiatrice et protégée par une
"passphrase". Par contre, la clef publique sera placée sur les serveurs
distants. De ce fait, seule la "passphrase" sera demandée à la machine
initiatrice pour déchiffrer la clé privée. La machine distante se chargera
alors de chiffrer la communictaion avec la clef publique pour échanger une clef
de session.

ssl
---

open vpn
--------

Chiffrement de médias
---------------------

De le même manière que l'on peut chiffrer un fichier ou un message, il est
possible de chiffer un media. La plupart du temps, l'utilisateur voudra
chiffrer un disque dur.

Il est difficile de chiffrer un disque dur sur lequel se trouve également le
système d'exploitation, en effet, pour démarrer, le système doit charger ses
fichiers depuis le disque, pour déchiffrer, un système minimal doit être
démarré. C'est le serpent qui se mord la queue. 

Pour palier à ce problème, on peut avoir un système minimal, à même de faire le
déchiffrement, sur un support séparé, par exemple un clef USB. On par alors de
"Full Disk Encryption".

Parmis les systèmes existants, on peut citer:

    * Truecrypt
    * Bitlocker sous MS Windows
    * cryptmount
    * LUKS Linux Unified Key Setup
    * cryptsetup

Fonctions de hachage cryptographiques.
--------------------------------------

Ces fonctions permettent de calculer une empreinte cryptographique.  Cette
empreinte permet de certfiier qu'un message (qui peut être un fichier) n'a pas
été modifié.  En effet, une suite de bytes ne devrait générer qu'une seule et
unique empreinte.

Néanmoins, le risque de collissions existe.  Une collision est le fait qu'une
empreinte identique existe pour deux ou plusieurs messages différents.

Voici quelques noms d'algorithmes de hachage:

    * md5
    * sha1
    * sha256
    * sha384
    * sha512
    * tiger
    * whirlpool
    * ...

Exemple d'empreinte d'un message::

    $ echo "Mon joli message" | md5sum
    a020b4d442d2c2997711a050daf2d155  -

La chaine de caractères "a020..." est une représentation hexadécimale de l'empreinte binaire md5.
Si on change un seul caractère de ce message, l'empreinte n'est plus la même.

Exemple::

    $ echo "Mon joli message." | md5sum
    bdbe3384e5cfdd67e53c931277e6b26e  -

Utilisation des fonctions de hachage:
-------------------------------------

Echanger la connaissance d'un secret. Imaginons qu'un système veuille vérifier
qu'un utilisateur connaît un mot de passe sans que le mot de passe ne soit
stocké sur ce système.

 

