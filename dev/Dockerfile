# -*- mode: sh -*-
# vi: set ft=sh :

FROM base

MAINTAINER RAvi Nukala &lt;nukala@gmail.com&gt;

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		build-essential \
		gcc \
		git \
		iputils-ping \
		iputils-tracepath \
		make \
		man \
		manpages-dev \
		python-software-properties \
		software-properties-common 

RUN apt-get clean && apt-get autoclean && apt-get autoremove && apt-get purge && rm -rf /var/lib/apt/lists/*
