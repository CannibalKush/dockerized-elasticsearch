FROM docker.elastic.co/elasticsearch/elasticsearch:6.5.4

RUN bin/elasticsearch-plugin install -b com.floragunn:search-guard-6:6.5.4-24.0

COPY --chown=elasticsearch:elasticsearch elasticsearch.yml /usr/share/elasticsearch/config/
COPY --chown=elasticsearch:elasticsearch certificates/ /usr/share/elasticsearch/config/
COPY certificates/sg_config.yml /usr/share/elasticsearch/plugins/search-guard-6/sgconfig/sg_config.yml
COPY certificates/sg_roles.yml /usr/share/elasticsearch/plugins/search-guard-6/sgconfig/sg_roles.yml