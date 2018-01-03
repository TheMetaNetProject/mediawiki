#!/bin/bash

./runonwiki $1 dumpBackup.php --current --filter=namespace:10 > dumps/templates.xml
./runonwiki $1 dumpBackup.php --current --filter=namespace:14 > dumps/categories.xml
./runonwiki $1 dumpBackup.php --current --filter=namespace:106 > dumps/forms.xml
./runonwiki $1 dumpBackup.php --current --filter=namespace:102 > dumps/properties.xml
./runonwiki $1 dumpBackup.php --current --filter=namespace:502 > dumps/glossary.xml
./runonwiki $1 dumpBackup.php --current --filter=namespace:550 > dumps/metaphors.xml
./runonwiki $1 dumpBackup.php --current --filter=namespace:552 > dumps/schemas.xml
./runonwiki $1 dumpBackup.php --current --filter=namespace:560 > dumps/constructanalyses.xml
./runonwiki $1 dumpBackup.php --current --filter=namespace:562 > dumps/cxnmps.xml
./runonwiki $1 dumpBackup.php --current --filter=namespace:564 > dumps/metarcs.xml
./runonwiki $1 dumpBackup.php --current --filter=namespace:570 > dumps/iconcepts.xml
./runonwiki $1 dumpBackup.php --current --filter=namespace:800 > dumps/citations.xml
./runonwiki $1 dumpBackup.php --current --filter=namespace:8 > dumps/mediawikis.xml
./runonwiki $1 dumpBackup.php --current --filter=namespace:0 > dumps/defaults.xml
