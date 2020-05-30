#!/bin/bash -x

docker run -d \
	-v ~/mine/docker/data/zook:/host \
	-p 2181:2181 \
	-t zook
