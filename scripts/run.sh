#!/bin/bash 

findPort() {
  IFS=',' read -a arr <<< "$CF_INSTANCE_PORTS"
  port=''
  for pair in "${arr[@]}"
  do
    if [[ "$pair" == *:9300 ]]
    then
            echo $pair | awk -F':' '{ print $1}'
    fi
  done

}

host_port=$(findPort)

`sed -i.bak s/127.0.0.1/$CF_INSTANCE_IP/g /elasticsearch/config/elasticsearch.yml`
`sed -i.bak s/9300/$host_port/g /elasticsearch/config/elasticsearch.yml`
/elasticsearch/bin/elasticsearch 
