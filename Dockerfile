# Build stage
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app

# Cache dependencies first
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Build source
COPY src ./src
RUN mvn clean package -DskipTests

# Runtime stage
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy jar from build stage
COPY --from=build /app/target/*.jar app.jar

# Optional: JVM tuning for bots
ENV JAVA_OPTS="-Xms256m -Xmx512m"

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
