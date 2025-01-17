# Use a base image with Java
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the files into the container
COPY . /app

# Build the application
CMD "mvn clean install"

# Expose the application port
EXPOSE 8080

# Command to run the application
CMD "mvn spring-boot:run"
