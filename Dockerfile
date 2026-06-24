ARG JAVA_VERSION=26

FROM gradle:9-jdk${JAVA_VERSION} AS build
WORKDIR /build

COPY build.gradle.kts settings.gradle.kts ./
RUN gradle --no-daemon dependencies

COPY src ./src
RUN gradle --no-daemon shadowJar

FROM eclipse-temurin:${JAVA_VERSION}-jre
WORKDIR /app

RUN groupadd -r jmusicbot && \
    useradd -r -g jmusicbot -d /app -s /sbin/nologin jmusicbot && \
    mkdir -p /app/config && \
    chown -R jmusicbot:jmusicbot /app

COPY --from=build --chown=jmusicbot:jmusicbot /build/build/libs/*-All.jar app.jar

VOLUME ["/app/config"]
USER jmusicbot

ENV JAVA_TOOL_OPTIONS="-Xms128m -Xmx512m -XX:+ExitOnOutOfMemoryError -Djava.awt.headless=true"

STOPSIGNAL SIGTERM

ENTRYPOINT ["java", "-jar", "app.jar", "--nogui"]

LABEL org.opencontainers.image.title="JMusicBot" \
      org.opencontainers.image.description="A Discord music bot" \
      org.opencontainers.image.source="https://github.com/jagrosh/MusicBot"
