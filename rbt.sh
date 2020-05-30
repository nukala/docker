#!/bin/bash

############################################################
# reboot.sh: Start all the docker containers needed
############################################################
#set -ef -o pipefail
[ "X${SHDEBUG}y" = "Xtruey" ] && set -x && DEBUGFD="/dev/tty"

prog=`basename $0`
dir=`dirname $0`

#echo "${prog}: dir=[${dir}]" && exit 1

cd ${dir}; pwd

KEEP_LOGS=true ./nginx/nx.sh 
echo $?; echo -n "Continue >"; read ans

KEEP_LOGS=true ./redsen/redsen.sh 
echo $?; echo -n "Continue >"; read ans

echo "${prog}: for RabbitMQ use the thing installed via homebrew . . . "
#KEEP_LOGS=true ./rabbit/rbt.sh 
#echo $?; echo -n "Continue >"; read ans

#echo "${prog}: disabled zookeeper(02/02/16) due to service-proxy issues, ok ?"
read ans
KEEP_LOGS=true ./zook/zook.sh 
echo $?; echo -n "Continue >"; read ans

KEEP_LOGS=true ./sslnx/snx.sh 
echo $?; echo -n "Continue >"; read ans

KEEP_LOGS=true rept.sh -nf -nap 2 -cmd 'docker ps'
exit $?

#zkstat; chkvag chkngx chksslnx 
