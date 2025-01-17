# Use an official Maven image as a parent image
FROM maven

# Set the working directory
WORKDIR /app

# Copy pom.xml and source files into the container
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn -B package --file pom.xml

# Expose the port your application runs on (default Spring Boot port)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "target/*.jar"]
