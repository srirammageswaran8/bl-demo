FROM gcr.io/distroless/java:11

USER root

ADD api/target/api.jar /api.jar
ADD admin/target/admin.jar /admin.jar
ADD site/target/ROOT.jar /site.jar

ENTRYPOINT ["java", "-jar"]