#!/bin/bash

pwd;
docker build -t snx .
stat=$?
echo -e "\n\n=== snx === \n\n"
echo -n " SslNginx=${stat}: Continue or sToP "; read ans
exit ${stat}

