#!/bin/bash

if [ ! -d fonts ]
then
    mkdir fonts
fi

cd fonts

if [ ! -e fonts.zip ]
then
    wget https://www.google.com/fonts/download?kit=_Adf4-WhHej-sE7xvVehE-cPfXIDoA1-1ANuFNVS5aP1JUXK0sIRq_Lnjg4rrjJWW2SqsgxoBlbItgSgHjyVJA -O fonts.zip
fi

unzip fonts.zip && rm fonts.zip



