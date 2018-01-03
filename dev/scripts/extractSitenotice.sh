#!/bin/sh
rm -f SiteNotice.xml
./runonwiki wiki/admin dumpBackup.php --current --pagelist=sitenoticePages.txt --output=file:SiteNotice.xml
