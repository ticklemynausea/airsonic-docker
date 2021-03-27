FROM arm32v7/openjdk:latest

ENV JAVA_JAR="/opt/airsonic/airsonic.war"
ENV JAVA_OPTS="-Xmx700m -server -Xmixed"
ENV AIRSONIC_HOME="/var/airsonic"
ENV ADDRESS="0.0.0.0"
ENV PORT="8080"
ENV CONTEXT_PATH="/"
ENV JAVA_ARGS="" 

RUN set -x \
    && apt update \
    && apt install -y \
      ffmpeg \
      lame \
      openssl \
      curl \
    && apt clean \
    && mkdir /opt/airsonic && cd /opt/airsonic \
    && curl -fsSL "https://github.com/airsonic/airsonic/releases/download/v10.6.2/airsonic.war" -o airsonic.war \
    && echo ok

COPY /scripts/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
