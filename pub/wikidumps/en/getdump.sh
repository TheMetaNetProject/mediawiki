#!/bin/bash

# -------------------------------------------------------------------
# Script to retrieve content from the MetaNet Development wiki to 
# import into the Public wiki.
#
# With the --external flag, items marked with a status other than
# 'problematic' will be included.
#
# To restrict it to items with status 'approved for release',
# --release-only should be specified.
#
# jhong@icsi
# -------------------------------------------------------------------

/bin/rm -f *.{sql,txt,xml}
lang=en

$MNDEVDIR/etc/wiki/getwikipages.py -l $lang -w /xa/metanet/services/mediawiki/dev/${lang}wiki -s ambrosia.icsi.berkeley.edu:2080 --protocol=https --scriptpath=/dev/${lang}/ --external --nohist --users pub

#$MNDEVDIR/etc/wiki/getwikipages.py -l $lang -w /xa/metanet/services/mediawiki/dev/${lang}wiki -s ambrosia.icsi.berkeley.edu:2080 --protocol=https --scriptpath=/dev/${lang}/ --release-only --nohist --users pub
