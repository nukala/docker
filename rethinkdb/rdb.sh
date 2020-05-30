#!/bin/bash -x

docker run -d -v ~/mine/docker/data/rdb:/data \
	-p 8080:8080 -p 28015:28015 -p 29015:29015 \
	-t rdb \
	"$@"
