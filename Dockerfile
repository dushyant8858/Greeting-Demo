# FROM maven:3.6.3-openjdk-11 as BUILDER
FROM maven:3.6.3-openjdk-8 as BUILDER

# RUN COPY ADD create layers
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package

FROM openjdk:8-jdk-alpine as PRODUCTION
# FROM openjdk:11-jre-slim

ARG server_port=8084

ENV SERVER_PORT=${server_port}

COPY --from=BUILDER /home/app/target/demo-0.0.1-SNAPSHOT.jar /usr/local/lib/greeting-demo.jar
EXPOSE ${server_port}
#ENTRYPOINT ["java","-jar","/usr/local/lib/greeting-demo.jar"]
# ENTRYPOINT java -Xmx1024m -Xms1024m -Dsome.prop=MyAppIsPassed -Dserver.port=${SERVER_PORT} -jar /usr/local/lib/greeting-demo.jar
ENTRYPOINT java -Dsome.prop=MyAppIsPassed -Dserver.port=${SERVER_PORT} -jar /usr/local/lib/greeting-demo.jar

# docker build -t greeting:latest --build-arg server_port=8084 --no-cache .
# docker rm greeting && docker run -itd --network=java-mvn -p 8084:8084 --name greeting greeting
# docker tag greeting:latest 275xxxxxx462.dkr.ecr.us-east-1.amazonaws.com/greeting:latest
# docker push 275xxxxxx462.dkr.ecr.us-east-1.amazonaws.com/greeting:latest

# aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 275xxxxxx462.dkr.ecr.us-east-1.amazonaws.com/pt-portal
