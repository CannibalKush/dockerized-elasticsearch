FROM docker.elastic.co/elasticsearch/elasticsearch:6.4.2

RUN bin/elasticsearch-plugin install -b com.floragunn:search-guard-6:6.4.2-23.2

COPY --chown=elasticsearch:elasticsearch elasticsearch.yml /usr/share/elasticsearch/config/
COPY --chown=elasticsearch:elasticsearch certificates/ /usr/share/elasticsearch/config/
COPY certificates/sg_config.yml /usr/share/elasticsearch/plugins/search-guard-6/sgconfig/sg_config.yml