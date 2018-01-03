#!/bin/sh

langs="metaphor en es ru fa"

for lang in $langs; do
    echo "processing $lang"
    cd $lang
    /bin/rm -f *.xml *.sql *.txt
    ./getdump.sh
    cd ..
done
