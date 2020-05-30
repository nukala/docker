# /github.com/stuartpb/rethinkdb-dockerfiles/blob/eb63b320ca55a792650ac0cab77847e985b9e245/jessie/1.16.3/Dockerfile
#  https://registry.hub.docker.com/_/rethinkdb/
FROM dev

MAINTAINER RAvi Nukala &lt;nukala@gmail.com&gt;

# Add the RethinkDB repository and public key
# "RethinkDB Packaging <packaging@rethinkdb.com>" http://download.rethinkdb.com/apt/pubkey.gpg
#RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 1614552E5765227AEC39EFCFA7E00EF33A8F2399
RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 1614552E5765227AEC39EFCFA7E00EF33A8F2399
RUN echo "deb http://download.rethinkdb.com/apt trusty main" > /etc/apt/sources.list.d/rethinkdb.list

ENV RETHINKDB_PACKAGE_VERSION 1.16.3~0trusty

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		rethinkdb=$RETHINKDB_PACKAGE_VERSION 

RUN apt-get clean && apt-get autoclean && apt-get autoremove && apt-get purge && rm -rf /var/lib/apt/lists/*

RUN adduser --home /home/rdb --disabled-password --gecos 'rdb' rdb 

# ONLY-while-debugging
# askubuntu.com/questions/168280/how-do-i-grant-sudo-privileges-to-an-existing-user
#RUN adduser spx sudo 	\
#	&& usermod -aG sudo spx
# askubuntu.com/questions/192050/how-to-run-sudo-command-with-no-password
#RUN echo "" >> /etc/sudoers \
#	&& echo '#forcibly add spx with no passwd' >> /etc/sudoers \
#	&& echo 'spx ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers

VOLUME ["/data"]
WORKDIR /data

RUN chown -R rdb /data

#   process cluster webui
EXPOSE 28015 29015 8080

USER rdb
RUN id -a

#http://crosbymichael.com/dockerfile-best-practices.html
ENTRYPOINT [ "/usr/bin/rethinkdb", "--directory", "/data", "--bind", "all" ]
#CMD ["--help"]

#CMD ["rethinkdb", "--bind", "all"]
#CMD [ "/bin/bash" ]
