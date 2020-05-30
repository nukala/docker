#-*- mode: sh -*-
# vi: set ft=sh :

FROM base

MAINTAINER RAvi Nukala &lt;nukala@gmail.com&gt;



# ONLY-while-debugging
# askubuntu.com/questions/168280/how-do-i-grant-sudo-privileges-to-an-existing-user
#RUN adduser nginx sudo 	\
#	&& usermod -aG sudo nginx
# askubuntu.com/questions/192050/how-to-run-sudo-command-with-no-password
#RUN echo "" >> /etc/sudoers \
#	&& echo '#forcibly add nginx with no passwd' >> /etc/sudoers \
#	&& echo 'nginx ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		lsof nginx 

RUN apt-get clean && apt-get autoclean && apt-get autoremove && apt-get purge && rm -rf /var/lib/apt/lists/*

RUN adduser --home /home/nginx --disabled-password --gecos 'nginx' --ingroup docker nginx
RUN mkdir /data

RUN chown -R nginx:docker /data

VOLUME ["/data"]

COPY nginx.conf /

EXPOSE 80 

WORKDIR /data/nginx/bin

ENTRYPOINT [ "/data/nginx/bin/osxRun.sh" ]
CMD [ "--fg" ]
