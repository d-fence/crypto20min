#!/usr/bin/python
import sys
from collections import defaultdict

ALPHABET = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
CLEF = "IFOSUP"

def rotation(s):
    n = s[1:]
    n += s[0]
    return n

def setGrille():
    grille = defaultdict(lambda: defaultdict(dict))
    al = ALPHABET
    for x in ALPHABET:
        num = 0
        for y in ALPHABET:
            grille[y][x] = al[num]
            num += 1
        al = rotation(al)
    return grille

def chiffrer(message):
    grille = setGrille()
    chiffre = ''
    kpos = 0
    for clair in message.replace(' ',''):
        if kpos >= len(CLEF):
            kpos = 0
        chiffre += grille[CLEF[kpos]][clair]
        kpos += 1
    return chiffre

def dechiffrer(message):
    grille = setGrille()
    dechiffre = ''
    kpos = 0
    for pasclair in message.replace(' ',''):
        if kpos >= len(CLEF):
            kpos = 0
        for k,value in grille[CLEF[kpos]].iteritems():
            if value == pasclair:
                dechiffre += k
        kpos += 1
    return dechiffre
   

if sys.argv[1] == '-c':
    print chiffrer(sys.argv[2])
elif sys.argv[1] == '-d':
    print dechiffrer(sys.argv[2])
