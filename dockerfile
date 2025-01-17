# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy all project files into the container
COPY . .

# Make the Gradle wrapper executable
RUN chmod +x ./gradlew

# Build the application (this step may take some time)
RUN ./gradlew build -x test --info

# Copy the built JAR file to the working directory
COPY build/libs/*.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
