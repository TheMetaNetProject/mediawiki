#!/bin/bash

#
# A script to be used by cron to run mediawiki jobs in the background.
# The settings below assume that the script will be run every minute
#

devlangs="en es ru fa"
publands="en"
maxjobs=500
threads=8
basedir=/xa/metanet/services/mediawiki
logfile=${basedir}/logs/runjobs.log

ulimit -S -n 4096
ulimit -S -u 4096

cd ${basedir}/dev
for lang in ${devlangs}; do
    cd ${lang}wiki/maintenance
    /usr/bin/php runJobs.php --maxjobs $maxjobs --procs $threads > $logfile 2>&1
    cd ../..
done

cd ${basedir}/pub
for lang in ${publangs}; do
    cd ${lang}wiki/maintenance
    /usr/bin/php runJobs.php --maxjobs $maxjobs --procs $threads > $logfile 2>&1
    cd ../..
done
