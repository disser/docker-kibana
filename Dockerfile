# Version 1.1

FROM devdb/elasticsearch:1.5.1

MAINTAINER Abhinav Ajgaonkar <abhinav316@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN \
	mkdir -p /opt/kibana /etc/service/kibana; \
	wget -O - https://download.elasticsearch.org/kibana/kibana/kibana-4.0.2-linux-x64.tar.gz \
	| tar xzf - --strip-components=1 -C "/opt/kibana";

COPY run /etc/service/kibana/

RUN /opt/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-river-couchdb/1.2.0

WORKDIR /opt/kibana

EXPOSE 5601

CMD ["/sbin/my_init"]

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
