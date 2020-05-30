#!/bin/bash -x

##############################################################################
# This uses container pulled down from docker-hub. Also uses persistent data folder
#
#   check life: http://localhost:28017/serverStatus?text=1
# - RAvi
##############################################################################

docker run \
	-v ~/mine/docker/data/mongo/db:/data/db \
	--name mongo \
	-p 27017:27017 \
	-p 28017:28017 \
	-d \
	mongo:3.4 \
	--rest --httpinterface
