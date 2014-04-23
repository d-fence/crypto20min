:title: Brève introduction à la cryptographie
:author: Saulo Pinto
:author: Christophe Monniez

:data-transition-duration: 1000
:skip-help: true
:auto-console: true

----

Brève introduction à la cryptographie

Auteurs: Saulo Pinto et Christophe Monniez

----

Plan
====

1. Définitions
2. Historique
3. Leçons de l'histoire
4. Chiffrement informatique
5. Chiffrement symétrique - XOR
6. Concepts de chiffrement assymétrique
7. Fonctions de hachage cryptographiques
8. Failles célèbres dans les systèmes de chiffrement

----

Définitions
===========

* Cryptologie : Science du secret
* Cryptographie : L'art des écritures cachées
* Cryptanalyse : L'art de rendre clair un texte chiffré
* Stéganographie : L'art de la dissimulation

.. note::
    Il est important de donner ici encore quelques définitions afin d'essayer de 
    diminuer la confusion entre les termes utilisés. De plus certains termes
    entendu proviennent directement de l'anglais, comme "encryption".

----

Définitions
===========

* Chiffrement:
    procédé par lequel on rend un message inintelligible pour ceux qui n'ont
    pas le code nécessaire pour le déchiffrement
* Décryptage:
    procédé de déchiffrement sans connaître la clef de chiffrement.
* Le chiffre :
    c'est la méthode de chiffrement ou l'organisme qui s'occupe de chiffrer

.. note::
    Il est donc préfréable d'utiliser le verbe "chiffrer" plutôt que "crypter" ou
    pire encore "encrypter". Par contre décrypter peut convenir lorsque l'on 
    déchiffre un message sans en possèder la clef.

----

Historique
==========

* Hiéroglyphes transformés - 4000 ans
* Nabuchodonosor - Crane rasé des esclaves
* Spartiates: scytale

.. image:: 640px-Skytale.png

.. note::
    Une methode de cryptanalyse de la Scytale consisterait à essayer des
    cylindres de différents diamètres afin décrypter le message.

----

Historique: Chiffre Atbash
==========================

* Utilisé par les hébreux
* Alphabet inverse:

+-+-+-+-+-+-+-+-+-+-+-+-+-+
|A|B|C|D|E|F|G|H|I|J|K|L|M|
+-+-+-+-+-+-+-+-+-+-+-+-+-+
|Z|Y|X|W|V|U|T|S|R|Q|P|O|N|
+-+-+-+-+-+-+-+-+-+-+-+-+-+

.. note::
    Pour déchiffrer on recode le message chiffré

----

Historique: Chiffre de César
============================

* 200 avant JC
* Simple substitution
* On décale l'alphabet d'un certain nombre de places

.. note::
    
    * Comme l'alphabet latin ne contient que 26 lettres, cette clef n'a                  
      donc que 25 positions possibles.                                                   
                                                                                   
    * Lorsque l'on utilise le code de César avec la clef 13, ce code peut aussi          
      porter le nom plus moderne de ROT13.                                               
                                                                                   
    * Le chiffrement par substitution simple peut être déjoué par l'analyse de fréquence.


----

Historique: Analyse de fréquences
=================================

* Facilite le déchiffrement d'une simple substitution

.. image:: analyse.png

----

Historique: Chiffre de Vigenère
===============================

* Évolution du code de César

.. image:: carre-vigenere.png 

.. note::

    * Chiffrement poly-alphabetique
    * Résiste mieux à l'analyse des fréquences
    * Donner un exemple au tableau

----

Historique: Cryptanalyse de Vigenère
====================================

* Chercher des motifs qui se répètent: cribs
* Permet de trouver la longueur de la clef
* Analyse des fréquences

----

Historique: Radiogramme de la victoire
======================================

* "Munitionierung beschleunigen punkst soweit nicht eingesehen auch bei tag"
    * Déchiffré par Georges Painvin
    * Chiffre ADFGVX:
        * substitution
        * suivi d'une transposition

----

Historique: Enigma
==================

.. image: 509px-Enigma_machine4.jpg

.. note::
    
    * Carnet de note avec position rotors et cablages chaque jour
    * Code de trois lettres au début de chaque comm
    * Rotors tourne sur appui touche
    * Brute force par la "Bombe" 
    * Bletchey park

----

Historique: Enigma
==================

* Capture d'un U-boot:
    * Mode d'emploi
    * Carnets de note
* Météo chifrrée = mots devinables = cribs
* Doublement de la clef

----

Leçons de l'histoire
====================


* La méthode devrait pouvoir tomber au mains de l'enemi
* Ne pas envoyer la clef de chiffrement avec le message
* Changer la clef de chiffrement
* Points faibles dans l'utilisation
* Echange d'un secret obligatoire = point faible

----

Chiffrement informatique
========================

* Types de chiffrement:
    * Symétrique: clef identique chiffrement - déchiffrement
    * Asymétrique: clefs différentes

----

Exemple de chiffrement symétrique avec XOR
==========================================

Table de vérité XOR:

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

----

Exemple de chiffrement symétrique avec XOR
==========================================

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
| Pattern Clé binaire | 01000011 | 01001100 | 01000101 | 01000011 | 01001100 | 01000101 | 01000011 |
+---------------------+----------+----------+----------+----------+----------+----------+----------+
| Messagecrypté       | 00001110 | 00001001 | 00010110 | 00010000 | 00001101 | 00000010 | 00000110 |
+---------------------+----------+----------+----------+----------+----------+----------+----------+

----

Concepts de chiffrement asymétrique
===================================

* Chiffrement avec une fonction difficilement réversible
    * Le paramètre de cette fonction est la clef publique
* Porte dérobée pour déchiffrer (clef secrète)
* Pas utilisé pour chiffrer en temps réel car trop lent

----

Chiffrement asymétrique: GPG/PGP
================================

* chiffrer des messages
* Générer une paire de clef
* Protéger la clef privée
* Réseau de confiance
* Empreinte de la clef publique
* Signer et authentifier
* Chiffrer pour plusieurs personnes
* Chiffrer pour soi-même 

.. note::
    * Parler des paquets signés (Debian ...)

----

Chiffrement asymétrique
=======================

Exemples d'utilisation conjointement au chiffrement symétrique:

    * ssh
    * ssl et tls
    * open vpn

----

Fonctions de hachage cryptographiques
=====================================

    * Calculer une empreinte cryptographique.  
    * Certifier qu'un message n'a pas été modifié.
    * Risque de collisions existe.
    * Faille = possible de provoquer une collision 


----

Fonctions de hachage cryptographiques
=====================================

    * md5
    * sha1
    * sha256
    * sha384
    * sha512
    * tiger
    * whirlpool
    * ...

----

Fonctions de hachage cryptographiques
=====================================

Exercice:

::
    $ echo "Mon joli message" | md5sum
    a020b4d442d2c2997711a050daf2d155  -

----

Failles célèbres dans les systèmes de chiffrement
=================================================

    * CVE-2008-0166: Générateur de nombres aléatoires
    * CVE-2014-1266 - "Apple goto fail" .. code::
      
        hashOut.data = hashes + SSL_MD5_DIGEST_LEN;
        hashOut.length = SSL_SHA1_DIGEST_LEN;
        if ((err = SSLFreeBuffer(&hashCtx)) != 0)
            goto fail;
        if ((err = ReadyHash(&SSLHashSHA1, &hashCtx)) != 0)
            goto fail;
        if ((err = SSLHashSHA1.update(&hashCtx, &clientRandom)) != 0)
            goto fail;
        if ((err = SSLHashSHA1.update(&hashCtx, &serverRandom)) != 0)
            goto fail;
        if ((err = SSLHashSHA1.update(&hashCtx, &signedParams)) != 0)
            goto fail;
            goto fail;
        if ((err = SSLHashSHA1.final(&hashCtx, &hashOut)) != 0)
            goto fail;
        err = sslRawVerify(...);

    * CVE-2014-0092 - "Gnu TLS goto fail"
    * CVE-2014-0160 - "Heartbleed"
