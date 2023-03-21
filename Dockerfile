FROM ubuntu:22.04

ARG USER=vscode
ARG NODE_VER=18

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    tzdata

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VER}.x | bash - \
    && apt-get install -y nodejs

# Clean
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# VSCode DevContainer
RUN adduser ${USER} \
    && chmod 777 /tmp

ENV TZ Asia/Tokyo
ENV LANG C.UTF-8
