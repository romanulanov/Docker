FROM ubuntu:24.04
RUN apt-get update \
    && apt-get install -y python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /app/StaticJinjaPlus/

ADD https://github.com/MrDave/StaticJinjaPlus.git /app/StaticJinjaPlus/

RUN python3 -m venv venv 
RUN venv/bin/pip3 install -r requirements.txt --no-cache-dir
