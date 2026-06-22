# Base image
FROM debian:stable-slim

# Define the version as a build argument
ARG VERSION

# https://github.com/0xHashRaptor/ForgeMiner/releases/download/v1.1.11/ForgeMiner-1.1.11-linux.tar.gz

# Update, install dependencies, and handle errors
RUN apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install --no-install-recommends \
        curl \
        xz-utils \
        wget \
        ca-certificates \
    && curl -L https://github.com/0xHashRaptor/ForgeMiner/releases/download/v${VERSION}/ForgeMiner-${VERSION}-linux.tar.gz -o /opt/ForgeMiner.tar.gz \
    && mkdir -p /opt/ForgeMiner \
    && tar -xf /opt/ForgeMiner.tar.gz -C /opt/ForgeMiner \
    && rm -rf /opt/SRBMiner-Multi.tar.gz \
    && apt-get -y purge xz-utils wget \
    && apt-get -y autoremove --purge \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

WORKDIR /opt/ForgeMiner

COPY entrypoint .
RUN chmod +x entrypoint

# Set entrypoint
ENTRYPOINT ["./entrypoint"]
