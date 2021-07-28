FROM maven:3-jdk-11-slim AS build
COPY pom.xml /usr/src/app/
COPY src/ /usr/src/app/src/
RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:11
COPY --from=build /usr/src/app/target/api-0.1.jar /usr/app/api-0.1.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/usr/app/api-0.1.jar"]