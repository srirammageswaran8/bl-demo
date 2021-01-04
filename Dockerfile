FROM gcr.io/distroless/java:11

USER root

COPY api/target/api.jar /api.jar
COPY admin/target/admin.jar /admin.jar
COPY site/target/ROOT.jar /site.jar

ENTRYPOINT ["java", "-jar"]