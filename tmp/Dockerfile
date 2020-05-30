# -*- mode: sh -*-
# vi: set ft=sh :

FROM        base
RUN         apt-get update && apt-get install -y redis-server daemon

#EXPOSE      6379
#EXPOSE	    26379

#ENTRYPOINT  ["/usr/bin/redis-server"]

COPY abc /abc

ENTRYPOINT [ "/abc" ]

CMD [ "--help " ]
