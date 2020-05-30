Goals:
  * start redsen cluster of 3 pairs of redis and sentinel servers
  * fromScratch everytime

Todo:
  * copy conf and bin into ~redsen 
  * save the logs in volume
  * daemon-ize scripts

== 04/21
  * follow along with https://www.digitalocean.com/community/tutorials/how-to-install-and-use-redis
  * does not work. Cannot daemonize properly

== 04/27
  * Works from an active terminal. Launch interactively and run the scr script. 
  * docker -d does not work
  * ports interefere. so export from grvbox clashes with vagrant. 

== 04/30 (using scr2 and update-rc.d)
  * does not start in background
  * supervisord does not work also
  * manually >
      docker run -p 6379:6379 -p 26379:26379 -v ~/mine/docker/data/redsen:/redsen -d -t redsen bash
         and then service redsen start
  * Start in background always exits

== 05/16/16 ( when redis complains about protected mode )
  * docker exec -i -t 1e0ad530cbac /bin/bash 
  * redis-cli 6[345]79; config set protected-mode no; config rewrite
