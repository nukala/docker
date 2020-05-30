#!/bin/bash

pwd;
docker build -t base .
stat=$?
echo -e "\n\n=== base === \n\n"
echo -n " Base=${stat}: Continue or sToP "; read ans

exit ${stat}
