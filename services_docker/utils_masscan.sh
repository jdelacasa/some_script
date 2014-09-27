#!/bin/bash

#elasticsearch_dir="/opt/elasticsearch-data"
workdir="$HOME/workspace/masscan-data"

#
# create persisten directory for elasticsearch
#

mkdir -p ${workdir}


# build docker from github

docker build -t="jdelacasa/masscan" github.com/jdelacasa/docker_masscan


echo "--------"
echo "masscan installed"
echo "persisten data in: ${workdir}"
echo "use: docker run -ti jdelacasa/masscan  masscan -p80,8000-8100 10.0.0.0/8 --rate=10000"
