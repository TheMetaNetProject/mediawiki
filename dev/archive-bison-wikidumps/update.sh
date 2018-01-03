#!/bin/sh

uname 0002

rm -rf en es ru fa metaphor
scp -r dosa:~/wikidumps/* .
