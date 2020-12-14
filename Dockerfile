FROM centos:7.8.2003

USER root

RUN yum install -y java-1.8.0-openjdk && \
    mkdir -p /opt/app

COPY api/target/api.jar /opt/app/api.jar
COPY admin/target/admin.jar /opt/app/admin.jar
COPY site/target/ROOT.jar /opt/app/site.jar

RUN chmod -R 775 /opt/app/

ENTRYPOINT ["java", "-jar"]