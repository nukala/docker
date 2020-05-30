#!/bin/bash

pwd;
docker build -t nx .
stat=$?
echo -e "\n\n=== nginx === \n\n"
echo -n " Nginx=${stat}: Continue or sToP "; read ans
exit ${stat}

