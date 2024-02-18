#
# Build stage
#
FROM maven:3.8.2-jdk-11 AS build
COPY . .
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM openjdk:11
COPY /target/fakiture-api-0.0.1-SNAPSHOT.jar fakiture-api.jar
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/fakiture-api.jar"]


