# ------------ Stage 1: Build the application ------------
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Set working directory inside the container
WORKDIR /app

# Copy project files into the container
COPY pom.xml . 
COPY src ./src

# Build the project and skip tests
RUN mvn clean package -DskipTests


# ------------ Stage 2: Run the application ------------
FROM eclipse-temurin:17-jdk-alpine

# Set working directory in runtime image
WORKDIR /app

# Copy the built JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port your Spring Boot app runs on
EXPOSE 8080

# Start the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
