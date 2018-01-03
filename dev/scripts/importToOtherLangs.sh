#!/bin/sh

#
# Given a wiki dump xml file, this script runs the importDump.php
# script on all the production wikis.
#
# jhong@icsi
#

if [[ ${1:0:1} == "/" ]] ; then
    infile="$1"
else
    infile=`pwd`/"$1"
fi

for i in es fa ru
do
cd /xa/metanet/services/mediawiki/dev/${i}wiki/maintenance
echo "Importing $1 into $i wiki"
php importDump.php $infile
done
