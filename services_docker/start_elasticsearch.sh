#!/bin/bash

#elasticsearch_dir="/opt/elasticsearch-data"
elasticsearch_dir="$HOME/workspace/elasticsearch-data"

#
# create persisten directory for elasticsearch
#

mkdir -p ${elasticsearch_dir}/data
mkdir -p ${elasticsearch_dir}/log
mkdir -p ${elasticsearch_dir}/plugins
mkdir -p ${elasticsearch_dir}/work

#create config file

cat <<EOF > ${elasticsearch_dir}/elasticsearch.yml
path:
  data: /data/data
  logs: /data/log
  plugins: /data/plugins
  work: /data/work
EOF

# build docker from github

docker build -t="jdelacasa/elasticsearch:1.3.2" github.com/jdelacasa/elasticsearch

# start instance

docker run -d -p 9200:9200 -p 9300:9300 -v ${elasticsearch_dir}:/data jdelacasa/elasticsearch:1.3.2 /elasticsearch/bin/elasticsearch -Des.config=/data/elasticsearch.yml

echo "--------"
echo "elasticsearch up"
echo "listen in 9300 and 9200"
echo "persisten data in: ${elasticsearch_dir}"
