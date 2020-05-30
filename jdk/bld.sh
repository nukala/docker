#!/bin/bash

pwd;
docker build -t jdk .
stat=$?
echo -e "\n\n=== jdk === \n\n"
echo -n " Jdk=${stat}: Continue or sToP "; read ans
exit ${stat}

