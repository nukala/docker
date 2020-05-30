#-*- mode: sh -*-
# vi: set ft=sh :

FROM dev

MAINTAINER RAvi Nukala &lt;nukala@gmail.com&gt;

RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		nginx \
		python-software-properties \
		software-properties-common 

RUN groupadd sslnx
# askubuntu.com/questions/168280/how-do-i-grant-sudo-privileges-to-an-existing-user
RUN adduser --home /home/sslnx --disabled-password --gecos 'sslnx' --ingroup sslnx sslnx 

# ONLY-while-debugging
# askubuntu.com/questions/168280/how-do-i-grant-sudo-privileges-to-an-existing-user
#RUN adduser sslnx sudo 	\
#	&& usermod -aG sudo sslnx
# askubuntu.com/questions/192050/how-to-run-sudo-command-with-no-password
#RUN echo "" >> /etc/sudoers \
#	&& echo '#forcibly add sslnx with no passwd' >> /etc/sudoers \
#	&& echo 'sslnx ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN apt-get clean && apt-get autoclean && apt-get autoremove && apt-get purge && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /data && \
	mkdir -p /var/log/nginx

RUN chown -R sslnx:sslnx /data /var/log/nginx
RUN chmod -R g+w /var/log/nginx

VOLUME ["/data"]

#USER sslnx 
WORKDIR /data/sslnx/bin

ENTRYPOINT [ "/data/sslnx/bin/osxRun.sh" ]
CMD [ "--fg" ]
