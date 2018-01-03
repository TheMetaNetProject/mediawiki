#!/bin/bash

# 
# Script to generate dumps of the development wiki for copying over to the
# external dev wiki.
#

# make everything group writable
umask 0002

langs=${1:-"en es ru fa"}

MNDEVDIR=${MNDEVDIR:-"/u/metanet/dev"}

for lang in $langs; do
    if [ -e ./$lang ]; then
        if [ -e ${lang}.bak ]; then
            /bin/rm -rf ./${lang}.bak
        fi
        /bin/mv ./$lang ./${lang}.bak
    fi
    mkdir -p $lang
    cd $lang
    wikiroot=/xa/metanet/services/mediawiki/dev/${lang}wiki
    ${MNDEVDIR}/etc/wiki/getwikipages.py -l $lang -w $wikiroot -s ambrosia.icsi.berkeley.edu:2080 --protocol=https --scriptpath=/dev/${lang}/ --users dev
    cd ..
done
