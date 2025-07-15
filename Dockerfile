FROM eclipse-temurin:17-jdk-slim

WORKDIR /app

COPY target/*.jar  app.jar

EXPOSE 6767

ENTRYPOINT ["java", "-jar", "app.jar" ]
