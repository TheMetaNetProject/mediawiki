#!/bin/sh
rm -f pagesToCopy.xml
pwd=`pwd`
cd /xa/metanet/services/mediawiki/dev/enwiki/maintenance
php dumpBackup.php --current --pagelist=$pwd/pagesToCopy.txt --output=file:$pwd/pagesToCopy.xml
