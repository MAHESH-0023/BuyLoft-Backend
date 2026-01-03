# Use Java 21 for the build stage
FROM maven:3.9.5-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
# Use the Maven wrapper in your repo to build
RUN chmod +x ./mvnw
RUN ./mvnw clean package -DskipTests

# Use a slim Java 21 runtime for the final image
FROM eclipse-temurin:21-jdk-slim
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]