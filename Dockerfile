#FROM maven:3.6.3-openjdk-11 as builder
FROM maven:3.6.3-openjdk-8 as builder

# RUN COPY ADD create layers
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:8-jdk-alpine as production
#FROM openjdk:11-jre-slim
COPY --from=builder /home/app/target/demo-0.0.1-SNAPSHOT.jar /usr/local/lib/demo.jar
EXPOSE 8082
ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]
