# ----------- Build Stage -----------
FROM eclipse-temurin:17-jdk-alpine AS build

WORKDIR /app

# Copy Maven wrapper and config
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Give execute permission to mvnw
RUN chmod +x mvnw

# Download dependencies
RUN ./mvnw dependency:go-offline

# Copy source code
COPY src ./src

# Build the application
RUN ./mvnw clean package -DskipTests

# ----------- Runtime Stage -----------
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar

# Expose the port your app uses (change if needed)
EXPOSE 8081

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
