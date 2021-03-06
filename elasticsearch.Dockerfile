FROM centos:7.0.1406
MAINTAINER Steffen Prince <steffen@sprin.io>
EXPOSE 9200

RUN yum install -y \
    tar \
    java-1.7.0-openjdk \
    && yum clean all

# Install elasticsearch
RUN curl -O https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.1.0/elasticsearch-2.1.0.tar.gz \
    && mkdir /opt/elasticsearch \
    && tar -xzvf ./elasticsearch-2.1.0.tar.gz --strip 1 -C /opt/elasticsearch \
    && rm ./elasticsearch-2.1.0.tar.gz
    
# Define mountable directories.
VOLUME ["/data"]

# Mount elasticsearch.yml config
ADD elasticsearch.yml /opt/elasticsearch/config/elasticsearch.yml

# Define working directory.
WORKDIR /data

CMD /opt/elasticsearch/bin/elasticsearch
