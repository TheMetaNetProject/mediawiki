#!/bin/bash

# -------------------------------------------------------------------
# Script to retrieve talk page content from a PUBLIC or STAGING wiki
# for later import into the same wiki, once it has been cleared and
# page content imported from the development wiki.
#
# jhong@icsi
# -------------------------------------------------------------------

/bin/rm -f *.{sql,txt,xml}
lang=en
$MNDEVDIR/etc/wiki/getwikipages.py -l $lang -w /xa/metanet/services/mediawiki/pub/${lang}wiki -s ambrosia.icsi.berkeley.edu:2080 --protocol=https --scriptpath=/pub/${lang}/ --talk talk
