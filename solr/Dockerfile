FROM solr:7.7.2-slim

USER root

COPY solr/standalone/solrhome/ server/solr/

RUN ls -la server/solr && \
    chmod -R 775 /opt/solr/

EXPOSE 8983

USER solr

ENTRYPOINT [ "/opt/solr/bin/solr", "start" , "-f" , "-p", "8983"]
