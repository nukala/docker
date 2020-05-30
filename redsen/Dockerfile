# -*- mode: sh -*-
# vi: set ft=sh :

FROM dev

MAINTAINER RAvi Nukala &lt;"nukala@gmail.com"&gt;

RUN apt-get update && apt-get upgrade -y

# 3.0.2 (http://redis.io/download) 
#  echo 'info' | redis-cli | grep -i ersion
#	wget http://download.redis.io/redis-stable.tar.gz \
#

RUN \
	wget http://download.redis.io/releases/redis-stable.tar.gz \
	&& tar xvzf redis-stable.tar.gz \
	&& cd redis-stable \
	&& make install \
	&& cd /tmp \
	&& /bin/rm -rf /redis-stable \
	&& /bin/rm /redis-stable.tar.gz 

RUN apt-get clean && apt-get autoclean && apt-get autoremove && apt-get purge && rm -rf /var/lib/apt/lists/*
RUN groupadd redsen
RUN adduser --home /home/redsen --disabled-password --gecos 'redsen' --ingroup redsen redsen 

# ONLY-while-debugging
# askubuntu.com/questions/168280/how-do-i-grant-sudo-privileges-to-an-existing-user
#RUN adduser redsen sudo 	\
#	&& usermod -aG sudo redsen
# askubuntu.com/questions/192050/how-to-run-sudo-command-with-no-password
#RUN echo "" >> /etc/sudoers \
#	&& echo '#forcibly add redsen with no passwd' >> /etc/sudoers \
#	&& echo 'redsen ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

#RUN apt-get remove -y --auto-remove build-essential make gcc manpages-dev git man vim software-properties-common python-software-properties curl wget \
#	vim-tiny vim-runtime vim-common perl python gcc cpp cpp-4.8 python3 python3.4 \


RUN mkdir /local \
	&& mkdir /local/conf

RUN chown -R redsen:redsen /local

VOLUME ["/redsen"]
RUN chown -R redsen:redsen /redsen

USER redsen 
WORKDIR /redsen/bin

EXPOSE 6379 26379
EXPOSE 6479 26479
EXPOSE 6579 26579

ENTRYPOINT [ "/redsen/bin/osxRun.sh" ]

CMD [ "--fg" ]
