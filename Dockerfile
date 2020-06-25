#### Stage 1: Build the application
FROM gradle:6.5.0-jdk8 AS build
COPY --chown=gradle:gradle . /home/gradle/src
ENV APP_PATH=/home/gradle/src
WORKDIR $APP_PATH
RUN gradle build

FROM openjdk:8-jre-slim

COPY controller/build/libs/controller-1.0-SNAPSHOT.jar ./

EXPOSE 8080
EXPOSE 5432

cmd java -jar controller-1.0-SNAPSHOT.jar