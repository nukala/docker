# -*- mode: sh -*-
# vi: set ft=sh :

FROM jdk

MAINTAINER RAvi Nukala &lt;nukala@gmail.com&gt;

RUN apt-get update \
	&& apt-get upgrade -y 

RUN groupadd zook
RUN adduser --home /home/zook --disabled-password --gecos zook --ingroup zook zook

# ONLY-while-debugging
# askubuntu.com/questions/168280/how-do-i-grant-sudo-privileges-to-an-existing-user
#RUN adduser zook sudo 	\
#	&& usermod -aG sudo zook
# askubuntu.com/questions/192050/how-to-run-sudo-command-with-no-password
#RUN echo "" >> /etc/sudoers \
#	&& echo '#forcibly add zook with no passwd' >> /etc/sudoers \
#	&& echo 'zook ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

# If wget fails, check http://www.apache.org/dyn/closer.cgi/zookeeper/
RUN wget http://apache.cs.utah.edu/zookeeper/zookeeper-3.4.9/zookeeper-3.4.9.tar.gz
RUN tar xzf zookeeper-3.4.9.tar.gz \
	&& rm zookeeper-3.4.9.tar.gz \
	&& mv zookeeper-3.4.9 zookeeper

RUN apt-get clean && apt-get autoclean && apt-get autoremove && apt-get purge && rm -rf /var/lib/apt/lists/*

#RUN apt-get remove -y make gcc manpages-dev man \
#	&& apt-get autoremove \
#	&& apt-get purge

ADD zoo.cfg /host/conf/zoo.cfg
ADD log4j.properties /host/conf/log4j.properties

ENV ZOOBINDIR=/zookeeper ZOOCFGDIR=/host/conf ZOO_LOG_DIR=/host/logs ZOO_LOG4J_PROP=/host/conf/log4j.properties


EXPOSE 2181

WORKDIR /host
VOLUME ["/host"]
USER zook

CMD ["/zookeeper/bin/zkServer.sh", "start-foreground"]
