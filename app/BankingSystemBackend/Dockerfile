# ----------- Build Stage -----------
FROM eclipse-temurin:17-jdk as build

WORKDIR /app

# Copy project files
COPY . .

# Ensure Maven wrapper is executable
RUN chmod +x mvnw

# Build the application with required JVM args for Lombok on Java 17+
RUN ./mvnw clean package -DskipTests \
    -Dmaven.compiler.compilerArgs="--add-exports=jdk.compiler/com.sun.tools.javac.processing=ALL-UNNAMED"

# ----------- Runtime Stage -----------
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy only the JAR from the build stage
COPY --from=build /app/target/*.jar app.jar

EXPOSE 8081

ENTRYPOINT ["java", "-jar", "app.jar"]
