# -*- mode: sh -*-
# vi: set ft=sh :

FROM dev

MAINTAINER RAvi Nukala &lt;nukala@gmail.com&gt;

RUN yes | add-apt-repository ppa:webupd8team/java

# auto accept oracle jdk license
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

# tiemensfamily.com/TimOnCS/2014/03/15/oracle-adds-license-to-java7-installer-fails/
# set jdk7 as default (www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html)
# also so=190582
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		oracle-java8-installer 

RUN apt-get clean && apt-get autoclean && apt-get autoremove && apt-get purge && rm -rf /var/lib/apt/lists/*
