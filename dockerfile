FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy Gradle wrapper and configuration files
COPY gradlew .
COPY gradle ./gradle
COPY build.gradle .
COPY settings.gradle .

# Copy source code
COPY src ./src

# Make Gradle wrapper executable
RUN chmod +x ./gradlew

# Disable Gradle daemon and clear cache (optional)
RUN echo "org.gradle.daemon=false" >> gradle.properties && \
    rm -rf ~/.gradle/caches/

# Build the application
RUN ./gradlew build -x test --stacktrace

# Copy built JAR file for execution
COPY build/libs/*.jar app.jar

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
