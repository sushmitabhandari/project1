#!/bin/bash
sudo su
sudo apt-get update
sudo apt-get install docker.io -y
service docker start
docker pull nginx
docker run -itd -p 80:80 nginx
