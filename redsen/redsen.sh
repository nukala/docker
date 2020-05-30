#!/bin/bash

here=`dirname $0`
#echo "here = [${here}] " 
cd ${here}; pwd
#exit 1

if [ "a${KEEP_LOGS}B" != "atrueB" ]
then
  /bin/rm -rf ./data/logs
  mkdir ./data/logs
fi

docker run -d \
	-v ~/mine/docker/data/redsen:/redsen \
	-p 6379:6379 -p 26379:26379 \
	-p 6479:6479 -p 26479:26479 \
	-p 6579:6579 -p 26579:26579 \
	-t redsen \
	-fg
