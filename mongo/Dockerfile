# Dockerizing MongoDB: Dockerfile for building MongoDB images
# Based on ubuntu:latest, installs MongoDB following the instructions from:
# http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/

FROM       dev

MAINTAINER RAvi Nukala &lt;nukala@gmail.com&gt;

RUN apt-get update && apt-get upgrade -y

RUN groupadd mongo

RUN adduser --home /home/mongo --disabled-password --gecos 'mongo' --ingroup mongo mongo 

# Installation:
# Import MongoDB public GPG key AND create a MongoDB list file
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

# Update apt-get sources AND install MongoDB
RUN apt-get install -y mongodb

RUN apt-get clean && apt-get autoclean && apt-get autoremove && apt-get purge && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /db

VOLUME ["/mongo"]
WORKDIR /mongo

RUN chown -R mongo:mongo /db
RUN chown -R mongo:mongo /mongo
USER "mongo"

# Expose port #27017 from the container to the host
EXPOSE 27017

# Set /usr/bin/mongod as the dockerized entry-point application
CMD [ "/usr/bin/mongod" ]
#ENTRYPOINT ["/bin/bash"]
