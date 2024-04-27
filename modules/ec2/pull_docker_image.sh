#!/bin/bash

# install docker in ubuntu
sudo apt update -y
sudo apt install docker.io -y

# pull the image to our docker hub repository
sudo docker pull ssah6694/my_img

# run the container to test the image 
sudo docker run -d -p 80:80 ssah6694/my_img