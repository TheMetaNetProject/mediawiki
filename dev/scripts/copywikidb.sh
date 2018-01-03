#!/bin/sh

#
# makes a copy of a wiki db
# usage: copywikidb.sh dbtocopy dbtocopyto
#
# Note that: LocalSettings.php, and InitializeSettings.php need to be
#    updated.  Also, a copy need to be made in the images directory
#    for graphviz.
#

FROMDB=$1
TODB=$2
read -s -p "Password: " PASSWORD
echo "copying wiki database $FROMDB to $TODB..."
echo "DROP DATABASE IF EXISTS $TODB; CREATE DATABASE $TODB CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql --password=$PASSWORD
/usr/bin/mysqldump --password=$PASSWORD $FROMDB | mysql --password=$PASSWORD $TODB
echo "GRANT ALL ON ${TODB}.* TO 'metanetwikiuser'@'localhost';" | mysql --password=$PASSWORD mysql
echo "GRANT ALL ON ${TODB}.* TO 'metanetwikiadmin'@'localhost';" | mysql --password=$PASSWORD mysql
