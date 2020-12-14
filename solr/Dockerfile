FROM centos:7.8.2003

USER root

RUN yum install -y java-1.8.0-openjdk && \
    mkdir -p /opt/solr && \
    curl https://archive.apache.org/dist/lucene/solr/7.7.2/solr-7.7.2.tgz -o /opt/solr/solr.tgz

WORKDIR /opt/solr

RUN tar -zxvf solr.tgz --directory /opt/solr/ --strip-components=1 && \
    ls -la && \
    rm -rf solr.tgz && \ 
    ls -la server/solr && \
    rm -rf server/solr/*

COPY solr/standalone/solrhome/ server/solr/

RUN ls -la server/solr && \
    chmod -R 775 /opt/solr/

ENTRYPOINT [ "/opt/solr/bin/solr", "start" , "-f" , "-p", "8898"]
