# -*- mode: sh -*-
# vi: set ft=sh :

FROM ubuntu:latest

MAINTAINER RAvi Nukala &lt;nukala@gmail.com&gt;

ENV TERM xterm

# use mkrslv.sh
#RUN mv /etc/resolv.conf /etc/resolv.conf.bak \
#RUN echo 'nameserver 8.8.8.8' >> /etc/resolv.conf \
#	&& echo 'nameserver 8.8.4.4' >> /etc/resolv.conf

# coreos uses' UTC
#  serverfault.com/questions/84521/automate-dpkg-reconfigure-tzdata/84528
RUN echo 'America/Los_Angeles ' > /etc/timezone \
	&& dpkg-reconfigure -f noninteractive tzdata
#http://www.thegeekstuff.com/2010/09/change-timezone-in-linux
RUN echo 'America/Los_Angeles' > /etc/timezone
RUN ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime

# ubuntuforums.org/showthread.php?t=1519005
#  also from others ...
# && rm -rf /var/lib/apt/lists/*
RUN apt-get -y update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		curl \
		daemon \
		htop \
		lsof \
		netcat \
		sudo \
		vim \
		wget \
	&& addgroup docker 

RUN apt-get clean && apt-get autoclean && apt-get autoremove && apt-get purge && rm -rf /var/lib/apt/lists/*
