#!/bin/bash

pwd;
docker build -t dev .
stat=$?
echo -e "\n\n=== dev === \n\n"
echo -n " Dev=${stat}: Continue or sToP "; read ans
exit ${stat}

