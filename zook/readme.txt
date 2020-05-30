Inspired from: https://github.com/relateiq/docker_public
* copied jdk7 and zookeper configs

From : github.com/boot2docker/boot2docker/issues/392#issuecomment-61999567; so=26686358
sudo route -nv add -net 192.168.59 -interface vboxnet0 

docker build -t z1 .
=== works 11/26/14 ===
To start: 
  docker run -d -p 2181:2181 z1  
check port number (from docker ps )
  docker port ec4ba315e5a350cc5f7679e89b21e2
use :
  echo 'stat' | nc `boot2docker ip 2>&1 | cut -d':' -f2 ` 2181

Port forwarding does not work. Tried:
   - VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port$i,tcp,,$i,,$i" (2181 and 41*)
   - docker -P
=== works 11/26/14 ===

== 02/25/15 ==
docker build -t z2 .
docker run -d -P z2 
echo 'stat' | nc `boot2docker ip` 49153
== 02/25/15 ==

docker run -d -p 127.0.0.1:2181:2181 z2

== 04/15/15 WORKS
  boot2docker halt and then 
      # https://github.com/docker/docker/issues/4007
      VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port2181,tcp,,2181,,2181";
  WORKS: dkrun -p 2181:2181 -d -t zk 

  `boot2docker ip` if above VBoxManage does not work
  564  echo 'ruok' | nc localhost 2181
  565  echo 'stat' | nc localhost 2181
  566  echo 'reqs' | nc localhost 2181
  567  echo 'envi' | nc localhost 2181
  564  echo 'dump' | nc localhost 2181

== 04/15/15
