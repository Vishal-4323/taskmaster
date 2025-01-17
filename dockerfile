# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the Gradle wrapper and build files
COPY gradlew .
COPY gradle ./gradle
COPY build.gradle .
COPY settings.gradle .

# Copy the source code
COPY src ./src

# Make the Gradle wrapper executable
RUN chmod +x ./gradlew

# Build the application
RUN ./gradlew build -x test

# Copy the built JAR file to a new location for execution
COPY build/libs/*.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
