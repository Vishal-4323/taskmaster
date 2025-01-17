# Use Maven with OpenJDK to build and run the application in one stage
FROM maven:3.8.6-openjdk-17

# Set the working directory
WORKDIR /app

# Copy pom.xml and source code
COPY pom.xml .
COPY src ./src

# Package the application (skip tests for faster builds)
RUN mvn clean package -DskipTests

# Expose the application port
EXPOSE 8080

# Command to run the application
ENTRYPOINT ["java", "-jar", "target/*.jar"]
