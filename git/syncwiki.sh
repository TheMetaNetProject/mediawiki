#!/bin/sh

# ==============================================================
# This script is run by a cron job and regularly syncs the
# MetaNet wiki to a file system structure.  Afterward if
# the sync included files relevant to the RDF, the wiki to
# RDF conversion and subsequent cache generation is triggered.
# ==============================================================

lang=${1}

if [ "$lang" = "" ]; then
    echo "Usage: $0 <lang>"
    exit 1
fi

umask 0002
if [ "$METANET_BASHCONFIG" = "" ]; then
    source /u/metanet/etc/metanet.bashrc
fi

WIKICMDPATH=${MNDEVDIR}/etc/wiki
SYNCCMD="python ${WIKICMDPATH}/wiki2git.py"
LOGDIR=/xa/metanet/services/mediawiki/logs
WIKIGITBASE=/xa/metanet/services/mediawiki/git
RDFBASE=/u/metanet/repository/rdf
MO_URL=https://ambrosia.icsi.berkeley.edu:2080/dev/en/MetaphorOntology.owl
NEO4J_HOME=/xa/metanet/services/neo4j
W2GLOGFILE=${LOGDIR}/wiki2git.${lang}.log
W2OLOGFILE=${LOGDIR}/wiki2owl.${lang}.log
RDFLOGFILE=${LOGDIR}/rdfcache.${lang}.log
# load wiki configuration settings
if [ -e ~/.conf.metanet ] ; then
    source ~/.conf.metanet
fi

# ============================================
# STEP 1: Sync the wiki to the git repository
# ============================================

WIKIGITDIR=$WIKIGITBASE/dev_${lang}wiki
cd $WIKIGITDIR
echo `date`"- running wiki2git sync for $lang as $USER" >> $W2GLOGFILE 2>&1
$SYNCCMD -d ${lang}mnwiki_dev -v /dev/${lang} >> $W2GLOGFILE 2>&1
RETURNCODE=$?
echo `date`"- return code is $RETURNCODE" >> $W2GLOGFILE 2>&1

# ===========================================================
# STEP 2: If something was changed, regenerate RDF and cache
# ===========================================================

# return code 1 indicates that something relevant was changed
if [ "$RETURNCODE" = "1" ]; then
    TSTAMP=`date +%Y-%m-%d_%T%z`
    RDFDIR=${RDFBASE}/${lang}/${TSTAMP}
    CACHEDIR=${RDFDIR}/cache
    wiki2owl -l $lang -u $MNWIKI_USER -p $MNWIKI_PW -r $WIKIGITDIR -o $MO_URL $RDFDIR/mr_${lang}.owl >> $W2OLOGFILE 2>&1
    $NEO4J_HOME/syncrdf.sh $lang >> $NEO4J_HOME/logs/syncrdf_${lang}.log 2>&1 &
    python -m mnrepository.metanetrdf -l $lang -i $RDFDIR/mr_${lang}.owl -c $CACHEDIR >> $RDFLOGFILE 2>&1
    cd ${RDFBASE}/${lang}
    /bin/rm -f latest
    /bin/ln -s ./${TSTAMP} latest
fi
