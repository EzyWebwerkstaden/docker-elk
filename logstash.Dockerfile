FROM centos:7.0.1406
MAINTAINER Steffen Prince <steffen@sprin.io>
EXPOSE 5000

RUN yum install -y \
    tar \
    java-1.7.0-openjdk \
    && yum clean all

# Install logstash
RUN curl -O https://download.elastic.co/logstash/logstash/logstash-2.1.0.tar.gz \
    && mkdir /opt/logstash \
    && tar -xzvf ./logstash-2.1.0.tar.gz --strip 1 -C /opt/logstash \
    && rm ./logstash-2.1.0.tar.gz

# Install contrib plugins
RUN /opt/logstash/bin/plugin install logstash-input-redis
RUN /opt/logstash/bin/plugin install logstash-output-elasticsearch
RUN /opt/logstash/bin/plugin install logstash-output-stdout

COPY logstash.conf /etc/logstash/logstash.conf

CMD /opt/logstash/bin/logstash -f /etc/logstash/logstash.conf
