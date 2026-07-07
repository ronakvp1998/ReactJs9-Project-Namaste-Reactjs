# Stage 1: Build the application
# Using a Gradle image that supports newer JDKs.
FROM gradle:jdk25 AS build
WORKDIR /app

# Copy necessary files for dependency resolution and build
COPY build.gradle settings.gradle ./
COPY src ./src

# Build the application, skipping tests to avoid Testcontainers looking for a Docker daemon during the image build
RUN gradle build -x test

# Stage 2: Run the application
# Using Eclipse Temurin for Java 25 support
FROM eclipse-temurin:25-jdk
WORKDIR /app

# Copy the built jar from the build stage
COPY --from=build /app/build/libs/*.jar app.jar

# Expose the default Spring Boot port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]