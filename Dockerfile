FROM ubuntu:22.04

ARG NODE_VER=18

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    curl \
    tzdata

RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VER}.x | bash - \
    && apt-get install -y nodejs

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV TZ Asia/Tokyo
ENV LANG C.UTF-8
