Introduction
============
 While I experiment with various infrastructure(s), programming environment(s), and language(s) -- I prefer not to play around on the bare-metal/host OS. Primarily due to fear of breaking something existing. Case in point:
  - MacOS comes bundled with an ancient version of Python
  - Day job requires use of python 2.x
  - Most new articles talk about using the latest version, at this time, 3.8

 My answer to those is to run experiments in a mostly disposable docker container and mount source folders as needed. Granted that this might increase bandwidth usage, but my day-job will not be significantly impacted.


Docker alias used:
-----------------
  `docker -D --dns 8.8.8.8 --dns 8.8.4.4 '
      AND
  `docker -D --dns 8.8.8.8 --dns 8.8.4.4 --ip 127.0.0.1'

NOTES
-----
To fix "Error response from daemon: client and server don't have same version (client : 1.14, server: 1.13)". Somehow related to recent update of both server and remote-control programs. Temporary trashing cleared up.
 boot2docker halt; boot2docker destroy
 /bin/rm -vrf ~/.boot2docker
 Also, launch virtualbox and set Cores/CPU utilizations after stopping the program

boot-docker: inspired by "getting started spring boot with docker" guide


mongo: inspired by http://docs.docker.com/examples/mongodb/

data : shared folder as volume


=== 04/15
 base : base ubuntu, mostly bare + wget + curl
 dev : base + vim + gcc + make + python and dev tools + man pages
 jdk : base + oracle jdk7
 zook : jdk + ; works, look at the readme

== 04/19
 rethindb : dev + rethinkdb; works as expected. Unfortuantely no java7 drivers

== 04/21
 redis : 3 pair of sentinel redis servers (like my vagrant)

== 05/20
dkimg | head -10; echo -n 'continue> '; read ans; dkrmi `dkimg | head -10 | awk ' { print $3 } '`
dkimg; echo -n 'continue> '; read ans; dkrmi `dkimg | awk ' { print $3 } '`
