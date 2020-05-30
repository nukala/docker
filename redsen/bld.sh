#!/bin/bash

pwd;
docker build -t redsen .
stat=$?
echo -e "\n\n=== redsen === \n\n"
echo -n " RedSen=${stat}: Continue or sToP "; read ans
exit ${stat}

