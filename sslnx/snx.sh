#!/bin/bash -x

docker run -d \
	-v ~/mine/docker/data:/data \
	-p 4332:4332 \
	-t snx
