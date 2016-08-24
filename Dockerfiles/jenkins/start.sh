#!/usr/bin/env bash

sleep 5
service docker start
docker run -d -p 80:80 -p 443:443 --restart always --name ngnix-proxy -v /certs:/etc/nginx/certs -v /var/run/docker.sock:/tmp/docker.sock:ro  droptica/nginx-proxy
su jenkins  /usr/local/bin/jenkins.sh
