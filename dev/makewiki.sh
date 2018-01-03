#!/bin/bash

echo "This script is here for posterity.  It has been disabled so that the"
echo "live wiki's are not inadvertently destroyed."
exit

# make files be group writable
umask 0002

#lang=${1:-en}
lang=${1:-ERROR}

# Settings
scriptpath="/xa/metanet/mdev/dist/etc/wiki"
wikiurl="http://ambrosia2.sys.icsi.berkeley.edu"

read -s -p "DB Password for $USER: " PASS
echo -e "\n"

read -s -p "Wiki admin pw: " wikipw
echo -e "\n"
wikiadminpw="$wikipw"

#
# This script is for me to save some typing
#
rm -rf mediawiki-1.24.2-$lang

#
# restart apache to clear caches
#
echo "gracefully restarting apache to clear APC cache"
sudo -iu mnauto /xa/metanet/services/init/apache.init.sh graceful

echo "running install"
$scriptpath/installwiki.py -v \
                           -l $lang \
                           --dbauser=$USER \
                           --dbapw=$PASS \
                           --wikipw=$wikipw \
                           --wikiadminpw=$wikiadminpw \
                           -u $wikiurl < /dev/null > install-${lang}-log 2>&1

echo sleep 5
sleep 5
echo "running import"
$scriptpath/importwikipages.py -d ./wikidumps/$lang \
                               -w ./mediawiki-1.24.2-$lang \
                               -s $wikiurl \
                               --wikipw=$wikipw \
                               --procs=20 \
                               --subs \
                               -p $scriptpath/dev_page_overrides dev < /dev/null > import-${lang}-log 2>&1
