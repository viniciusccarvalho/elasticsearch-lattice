#!/bin/bash -vx
`sed -i.bak s/127.0.0.1/$CF_INSTANCE_IP/g /elasticsearch/config/elasticsearch.yml`
/elasticsearch/bin/elasticsearch 
