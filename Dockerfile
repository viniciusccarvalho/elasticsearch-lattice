FROM java:7

RUN wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.4.tar.gz -O - | tar zxvf - && \
    mv elasticsearch-1.4.4 /elasticsearch && \
    /elasticsearch/bin/plugin -i mobz/elasticsearch-head && \
    /elasticsearch/bin/plugin -i lukas-vlcek/bigdesk
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

VOLUME ["/data", "/logs"]
EXPOSE 9200 9300
CMD ["elasticsearch/bin/elasticsearch"]


