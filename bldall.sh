#!/bin/bash

################################################################
# xm43406=docker run --restart always --name mysql8 --publish 43306:3306 -e MYSQL_ROOT_PASSWORD=r00t mysql:8.0
#
# 
################################################################
[ "x${SHDEBUG}Y" = "xtrueY" ] && set -x

prog=`basename $0`
prog=`dirname $0`

echo "${prog}: dir=[${dir}]"

# http://www.compciv.org/topics/bash/loops/
while read ln
do
  echo "== [${ln}] == "
  ${ln}
  stat=$?
  [ $stat -ne 0 ] && exit $stat
  echo -e "-- [${ln}] -- \n\n"

done < <(grep -h 'docker build ' *.dkf | cut -c3-)
