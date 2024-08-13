FROM python:3.12-slim

WORKDIR /StaticJinjaPlus/

RUN apt-get update \
    && rm -rf /var/lib/apt/lists/*

ADD https://github.com/MrDave/StaticJinjaPlus.git /StaticJinjaPlus/


RUN python3 -m venv venv
RUN pip install -r requirements.txt --no-cache-dir 
