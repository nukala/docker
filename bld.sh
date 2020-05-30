#!/bin/bash 

###########################################################
# To help build docker images
#
###########################################################

[ "x${SHDEBUG}Y" = "xtrueY" ]  && set -x

prog=`basename $0`

# redirect err to out
exec 2>&1 
# so=181953, write out to a file and console
exec &> >(tee -a bld.log)

echo "${prog}: - `date` Started "

here=`pwd`
dirs="./base ./dev ./nginx ./jdk ./redsen ./sslnx ./zook ./spx"

for d in $dirs
do
  echo " ==== ${d} ==== "
  cd "${d}"
  ./bld.sh
  cd ${here}
done

echo "${prog}: - `date` Finished "
