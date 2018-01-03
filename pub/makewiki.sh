#!/bin/bash

# ----------------------------------------------------------------
# Script for creating an instance of a staging versoin of the
# public wiki.  It calls scripts that install the mediawiki software,
# and imports the content.  The process involves re-setting the
# apache server in order to clear the APC cache.
#
# This script requires the caller to have an admin mysql account,
# as the mediawiki setup script creates databases, and sets user
# permissions.
#
# Note that for the content import to work, the script getdump.sh
# in /xa/metanet/services/mediawiki/pub/wikidumps/en needs first
# to be called.
#
# jhong@icsi
# ----------------------------------------------------------------

echo "Making new (staging) public wiki: "`date`

# Make files be group writable
umask 0002
if [ "$METANET_BASHCONFIG" = "" ]; then
    source /u/metanet/etc/metanet.bashrc
fi

# Currently only EN is public
lang=${1:-en}
#lang=${1:-ERROR}

CWD=`pwd`

# Settings
scriptpath=${MNDEVDIR}/etc/wiki
wikiserver=ambrosia.icsi.berkeley.edu:2080
wikiurl=https://$wikiserver
wikiroot=mediawiki-1.24.2-$lang
wikirootpath=$CWD/$wikiroot
mo_url=$wikiurl/pub/${lang}/MetaphorOntology.owl

# load wiki configuration settings
# rather than prompting from command-line passwords are specified in
# a config file
if [ -e ~/.conf.metanet ] ; then
    source ~/.conf.metanet
fi

# A mysql admin account is needed to grant privileges, which the
# installation script does, when a new installation is made.
# - this password is NOT specified in the file above for
#   security reasons
read -s -p "DB Password for $USER: " PASS
echo -e "\n"

wikiadminpw="$PUB_WIKI_ADMIN_PW"
wikidbuser="$PUB_WIKI_DB_USER"
wikidbpw="$PUB_WIKI_DB_PW"

if [ -e $wikiroot ]; then
    echo "dumping out the talk pages from the public wiki"
    talkdumplog=${CWD}/talkdump-${lang}-log
    pushd talkdumps/${lang}
    ./getdump.sh > $talkdumplog 2>&1
    popd

    # Delete the existing medawiki installation
    #
    rm -rf $wikiroot
fi

# Restart apache to clear caches (mainly APC)
#
echo "gracefully restarting apache to clear APC cache"
if [ "$USER" = "mnauto" ]; then
    /xa/metanet/services/init/apache.init.sh graceful
else
    sudo -iu mnauto /xa/metanet/services/init/apache.init.sh graceful
fi

echo "running install"
installlog=install-${lang}-log
$scriptpath/installwiki.py --staging -v -l $lang --dbauser=$USER --dbapw=$PASS --wikiuser=$wikidbuser --wikipw=$wikidbpw --wikiadminpw=$wikiadminpw -u $wikiurl < /dev/null > $installlog 2>&1

# Retrieve page content from the development wiki
echo "dumping pages from dev wiki"
getdumplog=${CWD}/getdump-${lang}-log
pushd wikidumps/${lang}
./getdump.sh > $getdumplog 2>&1
popd

# Import page content.  The --pub parameter causes the files to be filtered,
# so that certain fields like Comments, Entered by, Last reviewed by are
# omitted altogether (rather than merely hidden).
#
echo "running import of dev content"
importlog=import-${lang}-log
$scriptpath/importwikipages.py --pub -d ./wikidumps/$lang -w ./$wikiroot -s $wikiurl --wikipw=$wikiadminpw --procs=8 -p $scriptpath/public_page_overrides pub < /dev/null > $importlog 2>&1

# Import the talk pages
if [ -e "./talkdumps/en" ]; then
    echo "running import of pub talk pages"
    talkimportlog=talk-import-${lang}-log
    $scriptpath/importwikipages.py -d ./talkdumps/$lang -w ./$wikiroot -s $wikiurl --wikipw=$wikiadminpw --procs=8 --skip-users --skip-rebuild talk  < /dev/null >> $talkimportlog 2>&1
fi

# Create git dump
echo "creating git dump of content"
wiki2gitlog=${CWD}/wiki2git-${lang}-log
wikigitdir=git/${lang}
/bin/rm -rf $wikigitdir
git init $wikigitdir
pushd $wikigitdir
$scriptpath/wiki2git.py -d ${lang}mnwiki_pub -n -v /pub/$lang > $wiki2gitlog 2>&1
popd

# Create rdf dump
echo "creating rdf/owl dump"
rdfdir=${CWD}/rdf
wiki2owllog=wiki2owl-${lang}-log
/bin/rm -f $wiki2owllog
wiki2owl -l en -u $MNWIKI_USER -p $MNWIKI_PW -r $wikigitdir -o $mo_url $rdfdir/mr_${lang}.owl > $wiki2owllog 2>&1

# copy the rdf dump into the wiki root
if [ -e "$rdfdir/mr_${lang}.owl" ]; then
    cp $rdfdir/mr_${lang}.owl $wikirootpath
fi
