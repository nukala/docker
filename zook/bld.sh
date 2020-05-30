#!/bin/bash

pwd;
docker build -t zook .
stat=$?
echo -e "\n\n=== zook === \n\n"
echo -n " ZooKeeper=${stat}: Continue or sToP "; read ans
exit ${stat}


