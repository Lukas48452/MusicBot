# ---- Build stage ----
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /build

# copy only dependency files first (better caching)
COPY pom.xml .
RUN mvn -B dependency:go-offline

# copy source
COPY src ./src

# build jar
RUN mvn clean package -DskipTests

# ---- Runtime stage ----
FROM eclipse-temurin:17-jre

WORKDIR /app

# copy built jar (name may vary depending on repo config)
COPY --from=build /build/target/*.jar app.jar

# config directory
RUN mkdir -p /app/config

VOLUME ["/app/config"]

ENV JAVA_TOOL_OPTIONS="-Xms128m -Xmx512m"

ENTRYPOINT ["java", "-jar", "app.jar", "--nogui"]
