# Stage 1: Build
# Using a simpler maven tag that is universally available
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
COPY . .
RUN chmod +x ./mvnw
# This build step compiles your code into a .jar file
RUN ./mvnw clean package -DskipTests

# Stage 2: Runtime
# Using the most standard JRE 21 image
FROM eclipse-temurin:21-jre
WORKDIR /app
# This copies only the finished app from Stage 1 to Stage 2
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
