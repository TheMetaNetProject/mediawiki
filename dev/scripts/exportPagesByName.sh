#!/bin/sh
for pagelistfile in `/bin/ls pageexport/*.txt`; do
    filebase=`basename $pagelistfile .txt`
    ./runonwiki $1 dumpBackup.php --current --pagelist=$pagelistfile --output=file:pageexport/${filebase}.xml
done

