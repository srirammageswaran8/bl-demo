FROM maven:3.6.3-openjdk-11 as appbuilder

RUN mkdir -p /opt/build

COPY pom.xml /opt/build/
COPY site /opt/build/site
COPY core /opt/build/core
COPY admin /opt/build/admin
COPY api /opt/build/api

WORKDIR /opt/build

RUN ls -la

RUN mvn clean install

FROM gcr.io/distroless/java:11

USER root

WORKDIR /

COPY --from=appbuilder /opt/build/api/target/api.jar /api.jar
COPY --from=appbuilder /opt/build/site/target/ROOT.jar /site.jar
COPY --from=appbuilder /opt/build/admin/target/admin.jar /admin.jar

ENTRYPOINT ["java", "-jar"]