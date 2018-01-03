#!/bin/sh

./extractSitenotice.sh

for i in en es fa ru ling106
do
    echo "Running importDump for $i"
    ./runonwiki wiki/$i importDump.php SiteNotice.xml
done
