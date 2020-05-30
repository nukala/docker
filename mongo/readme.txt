Goals:
 * Run mongo with data living in container, logs and conf on host

=== 04/15/15 (works)
 * Got the file from website (docs.docker.com/examples/mongodb/)
 * start :  docker run -p 2701:27017 -t m1
 * check : nc -zvv `boot2docker ip` 2701
 * stop : docker ps; docker stop SOME_SHA

== 04/30 (does not build)
 * docker build -t m1 . fails 

== 07/09 (builds ok, but cant run. Look around with run -it m1 /bin/bash
 * SO=5091624 (nc -zvv localhost 27017)
