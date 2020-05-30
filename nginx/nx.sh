#!/bin/bash -x

docker run -d \
	-v ~/mine/docker/data:/data \
	-p 2663:80 \
	-t nx
