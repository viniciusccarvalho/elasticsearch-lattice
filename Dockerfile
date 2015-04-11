FROM java:7


ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.4.tar.gz -O - | tar zxvf - && \
    mv elasticsearch-1.4.4 /elasticsearch && \
    sed -i.bak s/127.0.0.1/$CF_INSTANCE_IP/g /elasticsearch/config/elasticsearch.yml && \ 
    /elasticsearch/bin/plugin -i mobz/elasticsearch-head && \
    /elasticsearch/bin/plugin -i lukas-vlcek/bigdesk && \
    /elasticsearch/bin/plugin -u https://github.com/viniciusccarvalho/elasticsearch-diego-discovery/releases/download/v1.0.0/diego-discovery-plugin-1.0.0-SNAPSHOT.zip -i diego




VOLUME ["/data", "/logs"]
EXPOSE 9200 9300
CMD ["elasticsearch/bin/elasticsearch"]


