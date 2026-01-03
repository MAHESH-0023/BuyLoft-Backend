# Stage 1: Build your application using Maven and Java 21
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
# Make the build script executable and run it
RUN chmod +x ./mvnw
RUN ./mvnw clean package -DskipTests

# Stage 2: Run your application using a more standard Java 21 image
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]