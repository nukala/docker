Introduction:
plain-text nginx installation

docker build -t ngx .
docker run -v ~/mine/docker/data:/data -p 2663:80 -it dev /bin/bash

curl http://icanhazip.com

apt-get install -y nginx lsof
/etc/init.d/nginx start

