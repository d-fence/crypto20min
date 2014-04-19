#!/usr/bin/python
# -*- coding: utf-8 -*-
import string
import codecs
import collections
import matplotlib.pyplot as plot
import numpy as np

LETTRES = u'abcdefghijklmnopqrstuvwxyzéèàêûô'

def pourcentage(data,total):
    """
    Remplace le nombre de lettre compté par sa
    fréquence d'apparition en pourcentage
    """
    pourcent = {}
    for lettre,nombre in data.iteritems():
        pourcent[lettre] = (float(nombre) / total) * 100
        #print u"Lettre {}: {} % ({})".format(lettre,pourcent[lettre],nombre)
    return pourcent

def analyse(fichier):
    """
    Compte le nombre d'apparition des lettres (LETTRES)
    dans le fichier UTF-8 passé en paramètre
    """
    compte = 0
    freq = dict( (x,0) for x in LETTRES)
    with codecs.open(fichier,"r","utf-8") as comedie:
        for ligne in comedie:
            for caractere in ligne.strip().lower():
                if caractere in LETTRES:
                    compte += 1
                    freq[caractere] += 1
    pourcent = pourcentage(freq,compte)
    alpha = collections.OrderedDict(sorted(pourcent.items()))
    return alpha

comedie = analyse("livre-comedie-humaine.txt")
histoires = analyse("livre-histoires-extraordinaires.txt")
nbl = np.arange(len(LETTRES))  
largeur = 0.4

fig, ax = plot.subplots()
barsComedie = ax.bar(nbl, comedie.values(), largeur, color='green')
barsHistoire = ax.bar(nbl + largeur, histoires.values(), largeur, color='orange')

ax.set_ylabel(u'Fréquences')
ax.set_title(u'Analyse des fréquences')
ax.set_xticks(nbl+largeur)
ax.set_xticklabels( comedie.keys() )

ax.legend( (barsComedie[0], barsHistoire[0]), (u'La comédie humaine (Honoré de Balzac)', u'Histoires extraordinaires (Edgar Allan Poe)') )

plot.savefig('analyse.png')

