#!/bin/bash -x

docker run -v ~/mine/docker/data/mongo:/data \
	-p 27017:27017 \
	-d -t m1
